

(function(i,s,o,g,r,a,m){
  if(i[g]){return;}
  i[g] = {};
  i[g].indexOf=function(t,a,b){for(var i=(b||0),j=t.length;i<j;i++){if(t[i]===a){return i;}}return-1;};
  function getCookieNoescape(a){var b=a+"=";var c=s.cookie;if(c.length>0){startIndex=i[g].indexOf(c,a);if(startIndex!=-1){startIndex+=a.length;endIndex=i[g].indexOf(c,";",startIndex);if(endIndex==-1)endIndex=c.length;return c.substring(startIndex+1,endIndex);}}return false;}
  function getCookie(a){var b=getCookieNoescape(a);if(b){return unescape(b);}return false;}
  

  i[g].init = function(username, user_name){
    if(username){
      username = "" + username;
    }else{
      username = null;
    }
    var user_type;
    var testers = {"nuvodi":"s","qatest":"s","qatest1":"s","qatest2":"s","cremaqa002":"s","cremaqa001":"s","littleblack23":"s","crematest":"s","crematest1":"s","qahbs002":"s","17646":"s","cremababy":"s","wisatest":"s","crema1":"s","makespjjang":"s","cremamof":"s","hicrema":"s","cremachma":"s","honey8922":"s","honey5922":"s","rlaaltmf3699":"s","rlaaltmf12345678":"s","mtest":"s","kkktest01":"s","kkktest02":"s","kkktest03":"s","kkktest04":"s","kkktest05":"s","jgminhnc":"s","cremadev":"l","cremahybrid":"t","mtest6":"s","mtest7":"s","mtest8":"s","mtest2":"s","mtest3":"s","mtest4":"s","mtest5":"s","mtest9":"s","dcdc01":"s","dtest01":"d","dtest02":"d","dtest03":"d","dtest04":"d","dtest05":"d","dtest06":"d","dtest07":"d","dtest08":"d","dtest09":"d","dtest10":"d","stest01":"s","stest02":"s","stest03":"s","stest04":"s","stest05":"s","stest06":"s","stest07":"s","stest08":"s","stest09":"s","stest10":"s","stest021":"s","stest022":"s","stest023":"s","stest024":"s","stest025":"s","stest026":"s","stest027":"s","stest028":"s","stest029":"s","stest030":"s","stest031":"s","stest032":"s","stest033":"s","stest034":"s","stest035":"s","stest036":"s","stest037":"s","stest038":"s","stest039":"s","stest040":"s","stest041":"s","stest042":"s","stest043":"s","stest044":"s","stest045":"s","stest046":"s","stest047":"s","stest048":"s","stest049":"s","stest050":"s","cremanew":"s","eunmidtest01":"d","cremaqa1@gmail.com":"s","cremtest":"d","eunmidtest02":"d","eunmistest03":"s","aim555crema":"s","test1":"s","dtest051":"d","supportpublic@crema.me":"s","supportpubl80173":"s","tjdgnsqn3":"d","cremattest":"t","crematttest":"t","mirakonghj":"d","dtest081":"d","tjdgnsqn133":"t","tester1":"s","barreltest":"s","asdlls":"s","asdlld":"s","admin":"s","hbs298":"s","hbs302":"s","hbs304":"s","hbs307":"s","hbs309":"s","hbs312":"s","ymlee23@lotte.com":"s","skek1703":"t","food9576":"d","cremareview":"t","supportpublic@the-nuvo.com":"t"};
    var hit = i.location.search.match(/crema-test=([a-z])/);
    var domain_prefix = (hit && hit[1]) || testers[username];
    if(domain_prefix){
      if(domain_prefix !== ""){
        i[g] = undefined;
        try{delete i[g];}catch(e){}
        a = s.getElementById("crema-jssdk");
        a.parentNode.removeChild(a);
        a = s.createElement(o);
        a.src = "http://" + domain_prefix + "widgets.cre.ma/akiii.co.kr/init.js";
        a.async = 1;
        a.id = "crema-jssdk";
        m = s.getElementsByTagName(o)[0];
        m.parentNode.insertBefore(a,m);
        if(i.cremaAsyncInit){
          i.cremaAsyncInit.hasRun = false;
        }
        return;
      }
      user_type = "tester";
    }else if(i[g].indexOf(["chichs","dj99","handae","mirakong729","gtosec","kyslong","gywls337","mirakong","yhtest","lgs901","thecrema","thecrema1","thecrema2","thecrema3","thecrema4","mc301","1","2","sadmin","kal0304kr","hyunmi246","kimting33","tfed1214","mutnam","gtosec1","nh@1c868","fa@21caf9a","info@bananavote.com","info11530","isoi","safety","hyunsik.choi@cre.ma","cremaphoto","info84628","info28172","supportpublic@cre.ma","supportpubl19280","supportpubl22864","supportpubl14568","crematest1","sseonaaa@naver.com","supportpubl13222","mem92","supportpublic@crema.me","supportpubl80173","b1234567","0line","qa_test001","qa_test002","qa_test003","qa_test004","qa_test005","jdh0912","perydot","subicura2","mani00000","kyoungpyo_kim","hyuno_chae","khc218","1056342460@k","supportpubl32674","1064902149@k","988895189@k","988894841@k","985383281@k","977536802@k","hyoloveeu","helele223","rdhujh07","felmata","byulys","alsw99","keathy86","optima2@type45.co.kr","crema1","crema2","nv_45565839","barreltest","aeron","kyh2035","swkwon","likiray","xodud1202@naver.com","soohyun.hong@sisun.com","pej4751@gmail.com","okil12","supportpubl85756","mineralbio","crema_dev","intzvill","minizip","test2","mirrh","kyoungmin.kim@mcircle.biz","cremazzang","minizip","test00867@daewoong.co.kr","keh0103@mcircle.biz","dhwlstlr02@naver.com","forsk89@gmail.com","dior810812@naver.com","eoqkrwlehf@naver.com","dubookim@naver.com","supportpubl90635","jsh0501","supportpubl23683","minyoii@naver.com","crema.live.tester@gmail.com","supportpubl96422","reina.lee@cre.ma","reinalee18496","sungjae.an@cre.ma","172531"], username) !== -1){
      user_type = "manager";
    }else{
      user_type = "user";
    }

    
    
i[g].info = {
  solution: "makeshop",
  mid: "akiii.co.kr",
  locale: "ko-KR",
  username: username,
  user_type: user_type,
  base_url: "http://review4.cre.ma",
  fit_base_url: "http://fit4.cre.ma",
  target_widget_base_url: "http://target.cre.ma",
  ad_base_url: "http://ad.cre.ma/akiii.co.kr",
  widgets_base_url: "http://widgets.cre.ma",
  review_api_base_url: "http://review-api4.cre.ma",
  fullscreen_popup: false,
  review_use_renewed_popup: true,
  review_use_inducing_popup_for_pc: false,
  review_max_popup_count_per_day: 3,
  use_legacy_review_for_powerapps: true,
  file_attach_not_supported_powerapps_android_versions: ["4.4"],
  disable_replace_state_in_mobile_app: false,
  show_review_widget: true,
  show_target_widget: true,
  show_fit_widget: false,
  secure_privacy: true,
  passphrase: "xYko8hZYMW9z",
  use_common_event: false,
  use_toggle_byapps_bottom_menu: true,
  use_fingerprint_device_token: false
};
if(user_name){i[g].info.user_name = user_name;}

m = s.getElementsByTagName(o)[0];
r = s.createElement(o);
r.async = 1;
r.src = "http://assets4.cre.ma/widgets/assets/pc-7278da1435469841e8fe81a03be4ea23b216e9906198ab7bb656d0f58e242e02.js";
r.id = "crema-jssdk";
r.charset = "UTF-8";
m.parentNode.insertBefore(r,m);


      r = document.createElement('link');
  r.href = "http://assets4.cre.ma/widgets/assets/pc-f68447834ec298d4156fcab650399e5c19d790d844dae7ae60ae80f82aeb0b5c.css";
  r.rel = 'stylesheet';
  r.type = 'text/css';
  m.parentNode.insertBefore(r,m);

  };
        function get_username_from_crema_element(w) {
  var r = w.getElementById("crema-login-username");
  if(!r){return null;}
  return r.innerHTML.replace(/<[^>]*>|\s/g, "");
}

username = getCookieNoescape("login_id");
if(!username){ 
  username = get_username_from_crema_element(s);
  if(!username && s.getElementById("crema-login-iframe")){
    var iframe = s.createElement("iframe");
    iframe.src = "http://"+i.location.host+"/shop/idinfo.html";
    iframe.style.display = "none";
    var interval;
    var iframe_loaded = function(username){
      if(interval){
        clearInterval(interval);
        interval = null;
      }
      i[g].init(username);
      s.body.removeChild(iframe);
    };
    var get_id_element = function(){
      var person_info = iframe.contentWindow.document.getElementById("personInfo");
      if(!person_info){person_info = iframe.contentWindow.document.getElementById("join_frm");}
      if(!person_info){return null;}
      var inputs = person_info.getElementsByTagName("input");
      for(var i=0; i<inputs.length; ++i){
        var input = inputs[i];
        if(input.name == "id"){return input;}
      }
      return null;
    };

    var check_username = function(force_complete){
      var username = get_username_from_crema_element(iframe.contentWindow.document);
      if(username){
        iframe_loaded(username);
        return;
      }

      var id_element = get_id_element();
      if(id_element){
        iframe_loaded(id_element.value);
        return;
      }

      if(force_complete){
        iframe_loaded(null);
      }
    };
    interval = setInterval(function(){check_username(false);}, 100);
    iframe.onload = function(){check_username(true);};
    s.body.appendChild(iframe);
  }
}else if(username && username[0] == '%'){
  r = s.getElementById("crema-login-username");
  username = isNaN(r) ? r.innerHTML : null;
}
i[g].init(username);


})(window,document,"script","crema");

