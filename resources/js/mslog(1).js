// version 1.0
function MSLOG_getCookie(name)
{
    var lims = document.cookie;
    var index = lims.indexOf("____MSLOG__" + name + "=");
    if (index == -1) { return null; };
    index = lims.indexOf("=", index) + 1; // first character
    var endstr = lims.indexOf(";", index);
    if (endstr == -1) { endstr = lims.length; }; // last character
    return unescape(lims.substring(index, endstr));
};

function MSLOG_setCookie(name,value,expireDate)
{
    var today = new Date();

    // 분단위
    //today.setTime(today.getTime() + (parseInt(expireDate)*60*1000) );
    today.setDate(today.getDate() + parseInt(expireDate));

    if (expireDate != 0) {
        document.cookie = "____MSLOG__" + name+"="+escape(value)+"; path=/; expires=" + today.toGMTString() + ";";
    } else {
        document.cookie = "____MSLOG__" + name+"="+escape(value)+"; path=/;";
    };
};
// 쿠키 삭제
function MSLOG_delCookie( cookieName )
{
    var expireDate = new Date();
    // 어제 날짜를 쿠키 소멸 날짜로 설정한다.
    expireDate.setDate( expireDate.getDate() - 1 );
    document.cookie = "__MSLOG_" + cookieName + "= " + "; path=/; expires=" + expireDate.toGMTString() + ";";
};
// 데이터전송
function MSLOG_send(data)
{
    var img = new Image();
    imgsrc = MSLOG_server + "/ms.log?" + data + "r=" + Math.random();
    img.src = imgsrc;
};
//장바구니를 위해 별도 함수 생성
function MSLOG_sendB()
{
    var img = new Image();
    imgsrc = MSLOG_server + "/ms.log?var=" +  MSLOG_var + "&code=" + MSLOG_code + "&type=B" + "&r=" + Math.random();
    img.src = imgsrc;
};
// 엔코딩
function MSLOG_encode64(input) {
    var ua = navigator.userAgent.toLowerCase();
    if (ua.indexOf(" chrome/") >= 0 || ua.indexOf(" firefox/") >= 0 || ua.indexOf(' gecko/') >= 0) {
        var StringMaker = function () {
            this.str = "";
            this.length = 0;
            this.append = function (s) {
                this.str += s;
                this.length += s.length;
            };
            this.prepend = function (s) {
                this.str = s + this.str;
                this.length += s.length;
            };
            this.toString = function () {
                return this.str;
            };
        };
    } else {
        var StringMaker = function () {
            this.parts = [];
            this.length = 0;
            this.append = function (s) {
                this.parts.push(s);
                this.length += s.length;
            };
            this.prepend = function (s) {
                this.parts.unshift(s);
                this.length += s.length;
            };
            this.toString = function () {
                return this.parts.join('');
            };
        };
    };
    var keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    var output = new StringMaker();
    var chr1, chr2, chr3;
    var enc1, enc2, enc3, enc4;
    var i = 0;

    while (i < input.length) {
        chr1 = input.charCodeAt(i++);
        chr2 = input.charCodeAt(i++);
        chr3 = input.charCodeAt(i++);

        enc1 = chr1 >> 2;
        enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
        enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
        enc4 = chr3 & 63;

        if (isNaN(chr2)) {
            enc3 = enc4 = 64;
        } else if (isNaN(chr3)) {
            enc4 = 64;
        };

        output.append(keyStr.charAt(enc1) + keyStr.charAt(enc2) + keyStr.charAt(enc3) + keyStr.charAt(enc4));
   };

   return output.toString();
};

var MSLOG_data = "";
var MSLOG_var_url = document.URL;
var MSLOG_var_referer = document.referrer;
// domain
var MSLOG_var_domain  = document.URL.split(/\/+/g)[1];
if (MSLOG_var_domain.substring(0,4) == "www.") { MSLOG_var_domain = MSLOG_var_domain.substring(4); };
// 최초방문
var MSLOG_var_initkey = MSLOG_getCookie("initkey");   
// 최초방문시날짜
var MSLOG_var_initday = MSLOG_getCookie("initday");   
// 구매시점의 날짜 저장쿠키
var MSLOG_var_orderday = MSLOG_getCookie("orderday");   
// 현재날짜
var MSLOG_d = new Date();
var MSLOG_curdate = MSLOG_d.getFullYear() + ("00" + (MSLOG_d.getMonth() + 1)).slice(-2) + ("00" + MSLOG_d.getDate()).slice(-2);
//모니터해상도
var MSLOG_resolution = screen.width+"_"+screen.height;
//레퍼러가 없을시 부모 레퍼러를 가져온다.
var MSLOG__rf = "";
// 부모의 url 을 가져온다 (frame 안에 들어있을 경우에)
var MSLOG__url = "";

// document.getElementsByTagName('frame')[1].contentWindow.top.location.href 
eval("try { MSLOG__rf = top.document.referrer; } catch (_e) { MSLOG__rf = ''; };");
eval("try { MSLOG__url = top.location.href; } catch (_e) { MSLOG__url = ''; };");

MSLOG_data = MSLOG_data + "domain=" + MSLOG_var_domain + "&";
MSLOG_data = MSLOG_data + "url=" + MSLOG_encode64(MSLOG_var_url) + "&";

if (MSLOG_code) MSLOG_data = MSLOG_data + "&code=" + MSLOG_code + "&";
if (MSLOG_var) MSLOG_data = MSLOG_data + "&var=" + MSLOG_var + "&";
if (MSLOG_resolution) MSLOG_data = MSLOG_data + "&resolution=" + MSLOG_resolution + "&";

// 최초접속
if (MSLOG_var_initkey == null) {
	MSLOG_var_initkey = Math.random();
	MSLOG_setCookie("initkey",MSLOG_var_initkey, 100);
	MSLOG_setCookie("initday",MSLOG_curdate, 100);

	//첫방문자 값
	MSLOG_data = MSLOG_data + "init=ok&";
}
// 최초접속 처리 되면 MSLOG_var_initkey 만 셋팅되고 MSLOG_var_initday 는 셋팅되지 않기 때문에 아래 조건에 포함된다.
// 이후 페이지 이동시에는 두 변수 모두가 존재하기 때문에 아래 조건 무시.
if (MSLOG_var_initkey != null && MSLOG_var_initday == null) {
	MSLOG_setCookie("initday",MSLOG_curdate,0);  // 브라우져종료시까지 저장되도록 변경
	//재방문처리 (위에는 날짜지만, 재방문처리위해 1회만 initday=ok로 보낸다)
	MSLOG_data = MSLOG_data + "initday=ok&";
}
// 사용자고유키
MSLOG_data = MSLOG_data + "initkey=" + MSLOG_var_initkey + "&";
if (MSLOG_var_initday != null) MSLOG_data = MSLOG_data + "initday=" + MSLOG_var_initday + "&";

// 레퍼러체크
//if (MSLOG_var_referer != null && MSLOG_var_referer.indexOf(MSLOG_var_domain) < 0) {
if (MSLOG_var_referer != null && MSLOG_var_referer != MSLOG__url) {
    // MSLOG_var_referer == MSLOG__url  // 최초유입
    // MSLOG_var_referer.split(/\/+/g)[1] == MSLOG__url.split(/\/+/g)[1]    // 내부에서 이동중
	MSLOG_data = MSLOG_data + "referer=" + MSLOG_encode64(MSLOG_var_referer) + "&";
} else {
    // 현재 페이지의 referer 와 부모 프레임(top)의 url 이 같은 경우는 iframe 내부라고 본다.
	MSLOG_data = MSLOG_data + "_ref=" + MSLOG_encode64( MSLOG__rf)+ "&";
    MSLOG_data = MSLOG_data + "_url=" + MSLOG_encode64( MSLOG__url)+ "&";
}
// 부모의 url
// 구매자수때문에체크 (같은사용자 재구매인지 체크 쿠키)
if (MSLOG_var_url.indexOf("orderend.html")>0) {
	MSLOG_setCookie("orderday",MSLOG_curdate, 90);
}
if (MSLOG_var_orderday != null) {
        MSLOG_data = MSLOG_data + "orderday=" + MSLOG_var_orderday + "&";
}

if (MSLOG_data.length > 0) {
	MSLOG_send(MSLOG_data);
}



