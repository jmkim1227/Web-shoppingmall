if(typeof jQuery == 'undefined'){
    var viewFinderHead= document.getElementsByTagName('head')[0];
    var viewFinderScript= document.createElement('script');
    viewFinderScript.type= 'text/javascript';
    viewFinderScript.src= '//vfinder.io/js/jquery-1.8.1.min.js';
    viewFinderHead.appendChild(viewFinderScript);
}

// HTML 태그 외부의 CSS 속성값 가져오기
var viewfinder_html_overflow = '';
if (typeof window.getComputedStyle == 'function') {
    viewfinder_html_overflow = window.getComputedStyle(document.getElementsByTagName('html')[0], null).overflow;
}

// 상점 레퍼러
var VfinderReferer = VfinderGetCookie('VfinderReferer');
if (typeof document.referrer == 'string') {
    try {
        var parseUrlArr = parse_url(document.referrer);
        var VfinderReferer = parseUrlArr.host;

        if (typeof VfinderReferer == 'string' && document.domain != VfinderReferer) {
            VfinderSetCookie('VfinderReferer', VfinderReferer);
            VfinderReferer = VfinderReferer;
        }
    }catch(e){}
}

window.onmessage = function(e) {
    var viewfinderRef = '';

    if (typeof e == "undefined") return false;

    if (typeof e.data.ref == 'string') {
        viewfinderRef = '&ref=' + e.data.ref;
    }

    // 상점 유입 레퍼러
    if (typeof VfinderReferer == 'string') {
        viewfinderRef += '&VfinderReferer=' + VfinderReferer;
    }

    if (document.getElementById('viewfinderPopup')) {
        if (typeof e.data.device == 'string') {

            if (typeof e.data.user_id == 'string' && e.data.user_id != '') viewfinderRef += "&user_id=" + e.data.user_id;
            if (typeof e.data.user_adminuser == 'string' && e.data.user_adminuser != '') viewfinderRef += "&user_adminuser=" + e.data.user_adminuser;
            if (typeof e.data.user_tab_type == 'string' && e.data.user_tab_type != '') viewfinderRef += "&user_tab_type=" + e.data.user_tab_type;

            if (e.data.device == 'web') {
                if (typeof e.data.media_id == 'string' && e.data.media_id != '') {

                    document.getElementById('viewfinderPopup').src="//vfinder.io/view/detail.html?shop_id="+e.data.shop_id+"&media_id=" + e.data.media_id + viewfinderRef;
                    document.getElementById('viewfinderPopup').style.display="block";

                    if (e.data.shop_id == 'yeoek') viewfinder_html_overflow = 'auto';

                    // HTML 태그 외부 CSS에 overflow 속성이 적용되어 있을 경우 HTML style 컨트롤
                    if (viewfinder_html_overflow == 'scroll' || viewfinder_html_overflow == 'auto') {
                        document.getElementsByTagName('html')[0].style.overflow = 'hidden';
                    } else {
                        document.body.style.overflow = "hidden";
                    }
                } else {
                    document.getElementById('viewfinderPopup').src="";
                    document.getElementById('viewfinderPopup').style.display="none";

                    if (e.data.shop_id == 'yeoek') viewfinder_html_overflow = 'auto';

                    if (viewfinder_html_overflow == 'scroll' || viewfinder_html_overflow == 'auto') {
                        document.getElementsByTagName('html')[0].style.overflow = '';
                    } else {
                        document.body.style.overflow = "";
                    }
                }
            } else {
                if (typeof e.data.popup == 'string' && e.data.popup === 'Y') {
                    window.open("//vfinder.io/view/detail.html?shop_id="+e.data.shop_id+"&media_id=" + e.data.media_id + "&device=mobile" + viewfinderRef, 'vfinder');
                } else {
                    location.href = "//vfinder.io/view/detail.html?shop_id="+e.data.shop_id+"&media_id=" + e.data.media_id + "&device=mobile" + viewfinderRef;
                }
            }
        }
    }

    try {
        var vfinderListFrameId = "viewfinderListFrame";
        if (typeof e.data.vfinderListFrameId == 'string') vfinderListFrameId = e.data.vfinderListFrameId;

        if (typeof e.data.height == 'number') document.getElementById('viewfinderFrame').style.height = e.data.height + 'px';
        if (typeof e.data.width == 'number') document.getElementById('viewfinderFrame').style.width = e.data.width + 'px';
        if (typeof e.data.list_width == 'number') document.getElementById(vfinderListFrameId).style.width = e.data.list_width + 'px';

        if (typeof e.data.list_height == 'number' && e.data.shop_id !== 'farmacykr') {
            document.getElementById(vfinderListFrameId).style.height = e.data.list_height + 'px';
        }
    } catch(e) {}
}

if ( window.addEventListener ){
    window.addEventListener( "load", setViewFinderWidth , false );
} else{
    window.attachEvent( "onload", setViewFinderWidth );
}

// mobile size
function setViewFinderWidth() {
    if (typeof jQuery != 'undefined' && typeof window.viewfinderFrame != 'undefined') {
        try{
            window.viewfinderFrame.postMessage({
                width: jQuery('body').width() - 20
            },"*");

            jQuery(window).bind('orientationchange', function(e) {
                var viewfinderSrc = jQuery('#viewfinderFrame').attr('src');
                if (viewfinderSrc != 'undefined' && viewfinderSrc.length > 0) {
                    jQuery('#viewfinderFrame').attr('src', viewfinderSrc);
                }
            });
        }catch(e){}
    }
}

// Create a cookie with the specified name and value.
function VfinderSetCookie(sName, sValue) {
    document.cookie = sName + "=" + escape(sValue);
    // Expires the cookie in one month
    var date = new Date();
    date.setMonth(date.getMonth()+1);
    document.cookie += ("; expires=" + date.toUTCString()); 
}

// Retrieve the value of the cookie with the specified name.
function VfinderGetCookie(sName)
{
  // cookies are separated by semicolons
  var aCookie = document.cookie.split("; ");
  for (var i=0; i < aCookie.length; i++)
  {
    // a name/value pair (a crumb) is separated by an equal sign
    var aCrumb = aCookie[i].split("=");
    if (sName == aCrumb[0]) 
      return unescape(aCrumb[1]);
  }
  // a cookie with the requested name does not exist
  return null;
}


function parse_url( url ) {
    if(typeof url == 'string') {
        // output following: scheme, host, user, pass, path, query, fragment
        var output = {};
        var split_scheme = url.split('//');

        // now we assume that we have: sheme, and the rest of the url after //
        if(split_scheme.length == 2) {
            // now we have the "scheme"
            // do not add if this URL is provided: //hostname/path?query=value#anchor
            if(split_scheme[0].length) {
                output.scheme = split_scheme[0].replace(':', '');
            }

            // we're now splitting the URL on first slash /
            // and assume that we'll get: host, (user and pass, if any);
            var split_url = split_scheme[1].split('/');
            if(split_url.length == 2) {
                // check if user/pass are provided
                var split_auth_hostname = split_url[0].split('@');
                output.host = split_auth_hostname[1];
                if(split_auth_hostname.length == 2) {
                    // now split the auth part of the hostname with ":"
                    var split_user_info = split_auth_hostname[0].split(':');
                    if(split_user_info.length == 2) {
                        // assume that both user and pass are provided now
                        output.user = split_user_info[0];
                        output.pass = split_user_info[1];
                    } else {
                        // assume that only "user" is provided
                        output.user = split_user_info[0];
                    }
                } else {
                    // assume that no auth info was provided in the URL
                    // first splitted element is the actual hostname
                    output.host = split_auth_hostname[0];
                }

                // now let's split the query/anchor from path
                var split_query = split_url[1].split('?');
                output.path = '/' + split_query[0];

                if(split_query.length == 2) {
                    // now split the anchor out of query string
                    var split_anchor = split_query[1].split('#');

                    // add the query without anchor
                    output.query = split_anchor[0];

                    // add anchoer
                    if(split_anchor.length == 2) {
                        output.fragment = '#' + split_anchor[1];
                    }
                } else {
                    output.query = split_query[0];
                }
            }
        }
        return output;
    }
}

function getViewfinderQuerystring(key, default_) {
    if (default_ == null) default_ = "";
    if (key == "" || key == undefined || key == "undefined") {
        var brandArr = Array("branduid", "goodsNo", "product_no", "index_no", "okdgg", "makeglob");
        for (var i = 0; i < brandArr.length; i++) {
            key = brandArr[i].replace(/[[]/, "[").replace(/[]]/, "]");
            switch (key) {
                case 'okdgg' :
                    var regex = new RegExp("/id/[0-9]+/");
                    var qs = regex.exec(window.location.href);
                    try{
                        qs = qs[0].replace(/\//g, '');
                        qs = qs.replace(/id/g, '');
                        if (qs != null) return qs;
                    } catch(e){}
                    break;
                case 'makeglob' :
                    var regex = new RegExp("/[0-9]+/cid/");
                    var qs = regex.exec(window.location.href);
                    try{
                        qs = qs[0].replace(/\//g, '');
                        qs = qs.replace(/cid/g, '');
                        if (qs != null) return qs;
                    } catch(e){}
                    break;
                default : 
                    var regex = new RegExp("[?&]" + key + "=([^&#]*)");
                    var qs = regex.exec(window.location.href);
                    if (qs != null) return qs[1];
                    break;
            }
        }
    } else {
        return key;
    }
    return default_;
}

function getInternetExplorerVersion() {
    var rv = -1;
    if (navigator.appName == 'Microsoft Internet Explorer') {
        var ua = navigator.userAgent;
        var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
        if (re.exec(ua) != null)
        rv = parseFloat(RegExp.$1);
    }
    return rv;
}
