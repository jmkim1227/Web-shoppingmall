jQuery(document).ready(function(){

    jQuery(".topBtn").click(function(e){            
        event.preventDefault();
        jQuery('html,body').animate({scrollTop:0}, 500);
    });
    jQuery(".bottomBtn").click(function(e){ 
        jQuery('html, body').animate({ scrollTop: jQuery(document).height()},800);
    });

});

