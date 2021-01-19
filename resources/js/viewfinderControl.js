var viewfinderPostMessage = function(data) {
    if (typeof data.media_link == 'string') {
        if (data.device == 'web') {
            var explorerVersion = getInternetExplorerVersion();
            if (explorerVersion > -1 && explorerVersion < 10) {
                window.open(data.media_link, 'instagram');
                return false;
            }
        }
    }

    // 상점 유입 레퍼러
    if ($('[name=VfinderReferer]').val()) {
        data.VfinderReferer = $('[name=VfinderReferer]').val();
    }
    window.parent.postMessage(data,"*");
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

// Create a cookie with the specified name and value.
function VfinderSetCookie(sName, sValue)
{
  document.cookie = sName + "=" + escape(sValue);
  // Expires the cookie in one month
  var date = new Date();
  date.setMonth(date.getMonth()+1);
  document.cookie += ("; expires=" + date.toUTCString());
}

function getViewfinderCookie(c_name) {
    var i,x,y,ARRcookies=document.cookie.split(";");
    for (i=0;i<ARRcookies.length;i++) {
        x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
        y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
        x=x.replace(/^\s+|\s+$/g,"");
        if (x==c_name) {
            return unescape(y);
        }
    }
}

$(document).ready(function() {

    $('[name=vf_member_id]').change(function() {
        $('[name=member_id_check]').val('N');
    });

    $('.cookie_chk').each(function() {
        var input_name = $(this).attr('name');
        if ($(this).val() == '') {
            var input_value = getViewfinderCookie(input_name);
            if (input_value != undefined) {
                $(this).val(input_value);
            }
        }
    });

    $('.msIdCheckBtn').click(function() {

        if (!$('[name=vf_member_id]').val()) {
            alert(language.MEMBER_ID);
            return false;
        }

        if (!$('[name=vf_password]').val()) {
            alert(language.MEMBER_PASSWORD);
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/view/process.html",
            data: "action_mode=benefit_check&shop_id=" + $('[name=shop_id]').val() + "&member_id=" + encodeURIComponent($('[name=vf_member_id]').val()) + '&password=' + encodeURIComponent($('[name=vf_password]').val()) + "&benefit=" + $('[name=benefit]').val() + "&media_id=" + $('[name=media_id]').val(),
            dataType: "json",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function (response) {
                if (response.result == true) {
                    $('[name=member_id_check]').val('Y');
                    alert(language.VALIDATE_COMPLETE);
                } else {
                    alert(response.msg);
                }
            }, error: function (jqXHR, textStatus, errorThrown) {

            }
        });
    });

    $('.msIdBtn').click(function() {
        if (document.frm.vf_token.value == '') {
            window.open(loginUrl, 'viewFinderLogin', 'width=500px, height=400px;');
        } else {

            if (!$('[name=vf_member_id]').val()) {
                alert(language.MEMBER_ID);
                return false;
            }

            if (!$('[name=vf_password]').val()) {
                alert(language.MEMBER_PASSWORD);
                return false;
            }

            if ($('[name=member_id_check]').val() == 'N') {
                alert(language.VALIDATE_CHECK);
                return false;
            }

            params = "&shop_id=" + $('[name=shop_id]').val() + "&member_id=" + encodeURIComponent($('[name=vf_member_id]').val()) + '&password=' + encodeURIComponent($('[name=vf_password]').val()) + "&benefit=" + $('[name=benefit]').val() + "&media_id=" + $('[name=media_id]').val();

            $.ajax({
                type: "POST",
                url: "/view/process.html",
                data: "action_mode=benefit" + params,
                dataType: "json",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                success: function (response) {
                    if (response.result == true) {

                        if ($('[name=benefit]').val() != 'like') {
                            alert(language.FOLLOW_BENEFIT_COMPLETE);
                        } else {
                            alert('혜택이 지급되었습니다.');
                        }
                        if ($('[name=device]').val() == 'web') {
                            $('.memberLayer').hide();
                        } else {
                            window.close();
                        }
                    } else {
                        alert(response.msg);
                    }
                }, error: function (jqXHR, textStatus, errorThrown) {

                }
            });
        }
    });

    $('.followBtn').click(function(e) {

        window.open("https://www.instagram.com/" + $('[name=username]').val(), 'viewFinderLogin');
        return;

        $('[name=benefit]').val('follow');

        window.open(loginUrl, 'viewFinderLogin', 'width=500px, height=580px;');

        if (document.frm.vf_token.value == '') {
            window.open(loginUrl, 'viewFinderLogin', 'width=500px, height=580px;');
        } else {
            $.ajax({
                type: "POST",
                url: "/view/process.html",
                data: "action_mode=relationshop&shop_id=" + $('[name=shop_id]').val(),
                dataType: "json",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                success: function (response) {
                    if (response.result == true) {
                        alert(language.COMPLETE_MESSAGE);
                    } else {
                        if (response.benefit_use == 'Y') {
                            if ($('[name=device]').val() == 'web') {
                                $('.memberLayer').show();
                            } else {
                                var popup_check = window.open('./follow_benefit.mobile.html?shop_id=' + $('[name=shop_id]').val(), 'follow_benefit');
                                if (popup_check == undefined) {
                                    alert(language.FOLOW_BENEFIT_POPUP);
                                }
                            }
                        } else {
                            if (response.msg.length > 0) {
                                alert(response.msg);
                                if (response.login_layer == true) {
                                    window.open(loginUrl, 'viewFinderLogin', 'width=500px, height=400px;');
                                }
                            } else {
                                alert(language.FAIL_MESSAGE);
                            }
                        }
                    }
                }, error: function (jqXHR, textStatus, errorThrown) {

                }
            });
        }
    });

    // 상점 로그인 레이어 숨김
    $('#layermodal2 .benefit-btn-close').click(function() {
        $('.memberLayer').hide();
    });

    $('.likeBtn').click(function(e) {

        return;

        $('[name=benefit]').val('like');

        if (document.frm.vf_token.value == '') {
            window.open(loginUrl, 'viewFinderLogin', 'width=500px, height=400px;');
        } else {
            var obj = $(this);
            userMediaType = '';
            $.ajax({
                type: "POST",
                url: "/view/process.html",
                data: "action_mode=like&shop_id=" + $('[name=shop_id]').val() + "&media_id=" + $('[name=media_id]').val(),
                dataType: "json",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                success: function (response) {
                    if (response.result == true) {
                        $('.media_likes_count').text(response.likeCnt);
                        // 모바일 상품 상세 페이지용
                        $(obj).parent().addClass('on');
                        $(obj).addClass('on');

                        if (response.benefit_use == 'Y') {
                            $('[name=media_id]').val($('[name=media_id]').val());

                            if ($('[name=device]').val() == 'web') {
                                $('.memberLayer').show();
                            } else {
                                var popup_check = window.open('./follow_benefit.mobile.html?benefit=like&shop_id=' + $('[name=shop_id]').val() + '&media_id=' + $('[name=media_id]').val(), 'follow_benefit');
                                if (popup_check == undefined) {
                                    alert(language.FOLOW_BENEFIT_POPUP);
                                }
                            }
                        }
                        var vFinderUserPage = "http://vfinder.io/view/user.html?shop_id="+$('[name=shop_id]').val()+"&name="+$('[name=vf_name]').val();
                        if ($('[name=device]').val() == 'mobile') vFinderUserPage += "&device=mobile";
                        $('.userPageLink').text(vFinderUserPage).attr('href', vFinderUserPage).attr('target', '_blank');
                        $('.userPageMove').attr('data-src', vFinderUserPage);
                        $('.userPageLinkSrc').text(vFinderUserPage);

                        var vFinderUserLayer = ($('[name=device]').val() == 'mobile') ? "layer-popup" : "like_popup";
                        $('.'+ vFinderUserLayer +', .'+ vFinderUserLayer +' .inner .popup1, .'+ vFinderUserLayer +' .inner .popup3').hide();
                        switch (response.userMediaType) {
                            case 'section1' :
                                $('.'+ vFinderUserLayer +', .'+ vFinderUserLayer +' .inner .popup1').show();
                                break;
                            case 'section2' :
                                $('.'+ vFinderUserLayer +', .'+ vFinderUserLayer +' .inner .popup3').show();
                                userMediaType = response.userMediaType;
                                break;
                        }
                    } else {
                        if (typeof response.msg != 'undefined') {
                            alert(response.msg);
                        }
                    }
                }, error: function (jqXHR, textStatus, errorThrown) {

                }
            });
        }
    });

    $('.btn-like').click(function() {
        if (document.frm.vf_token.value == '') {
            window.open(loginUrl, 'viewFinderLogin', 'width=500px, height=400px;');
        } else {
            window.open("./user.html?shop_id="+ $('[name=shop_id]').val() +"&username=" + $('[name=vf_name]').val(), 'vfinderUserPage');
        }
    });

    $('[name=vf_content]').click(function() {
        window.open($('[name=media_link]').val(), 'media_link');
    });

    $('[name=vf_content]').change(function(e) {
        if (document.frm.vf_token.value == '') {
            window.open(loginUrl, 'viewFinderLogin', 'width=500px, height=400px;');
        }
    });

    $('.btn-entry').click(function() {

        window.open($('[name=media_link]').val(), 'media_link');
        return;

        if (!$('[name=vf_content]').val()) {
            alert(language.COMMENT_MESSAGE);
            return false;
        }
        if (!$('[name=media_id]').val()) return false;

        $('[name=frmComment]').submit();
    });

    $('[name=frmComment]').submit(function() {
        if (!$('[name=vf_content]').val()) {
            alert(language.COMMENT_MESSAGE);
            return false;
        }
        if (document.frm.vf_token.value == '') {
            alert(language.INSTAGRAM_LOGIN);
            window.open(loginUrl, 'viewFinderLogin', 'width=500px, height=400px;');
            return false;
        }
        if (!$('[name=media_id]').val()) return false;
        $.ajax({
            type: "POST",
            url: "/view/process.html",
            data: "action_mode=commentWrite&shop_id="+ $('[name=shop_id]').val() +"&media_id="+ $('[name=media_id]').val() +"&comment="+ $('[name=vf_content]').val(),
            dataType: "json",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function (response) {
                var html = '';
                var commentHtml = '';
                if (response.result == true) {
                    html += '<li class="clearfix">';
                    html += '<p class="thumb-user"><img src="'+$('[name=vf_profile]').val()+'" alt="icon" width="34" height="34" style="border-radius:50%;"></p>';
                    html += '<dl>';
                    html += '<dt><a href="https://www.instagram.com/'+$('[name=vf_name]').val()+'/" target="_BLANK">'+$('[name=vf_name]').val()+'</a></dt>';
                    html += '<dd class="chat">'+ $('[name=vf_content]').val() +'</dd>';
                    html += '<dd>'+ language.NOW +'</dd>';
                    html += '</dl>';
                    html += '</li>';

                    commentHtml += '<li>';
                    commentHtml += '    <p class="cmt-logo">';
                    commentHtml += '        <a href="https://www.instagram.com/'+$('[name=vf_name]').val()+'/" target="_BLANK"><img src="'+$('[name=vf_profile]').val()+'" alt="icon" class="profile_img"</a>';
                    commentHtml += '    </p>';
                    commentHtml += '    <dl>';
                    commentHtml += '        <dt><a href="https://www.instagram.com/'+$('[name=vf_name]').val()+'/" target="_BLANK">'+$('[name=vf_name]').val()+'</a></dt>';
                    commentHtml += '        <dd class="cmt-txt">'+ $('[name=vf_content]').val() +'</dd>';
                    commentHtml += '        <dd class="time">'+ language.NOW +'</dd>';
                    commentHtml += '    </dl>';
                    commentHtml += '</li>';

                    $('.commentsCnt').text(response.commentCnt);
                    $('.area .msg').hide();
                    $('.area .list').prepend(html);
                    $('.comment-area ul').prepend(commentHtml);
                    $('[name=vf_content]').val('');
                    alert(language.WRITE_SUCCESS);
                } else {
                    alert(language.WRITE_FAIL);
                }
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(textStatus.msg);
            }
        });

        return false;
    });

    $('.userMediaSaveBtn').click(function() {
        $.ajax({
            type: "POST",
            url: "/view/process.html",
            data: "action_mode=userMediaSave&shop_id="+ $('[name=shop_id]').val() +"&media_id="+ $('[name=media_id]').val(),
            dataType: "json",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function (response) {
                var vFinderUserLayer = ($('[name=device]').val() == 'mobile') ? "layer-popup" : "like_popup";
                $('.'+ vFinderUserLayer +', .'+ vFinderUserLayer +' .inner .popup1').hide();
                switch (response.userMediaType) {
                    case 'section2' :
                        $('.'+ vFinderUserLayer +', .'+ vFinderUserLayer +' .inner .popup3').show();
                        break;
                }
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert(textStatus.msg);
            }
        });
    });

    $('.userPageLink').click(function() {
        $('.like_popup, .like_popup .inner .popup1, .like_popup, .like_popup .inner .popup3').hide();
        $('.layer-popup, .layer-popup .inner .popup1, .layer-popup, .layer-popup .inner .popup3').hide();
    });

    $('.userPageMove').click(function() {
        window.open($(this).attr('data-src'), 'userPage');
    });
});
