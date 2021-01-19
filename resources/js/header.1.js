jQuery(document).ready(function(){

    jQuery('.search_icon').on('click', function(e){
        e.preventDefault();
        jQuery('.searchArea').toggle();
        jQuery('.search_icon').toggleClass('active');

    });

    jQuery('.menu_Btn').on('click', function(e){
        e.preventDefault();
        jQuery('.totalMenu').toggle();
        jQuery(this).toggleClass('active');

    });
    
    jQuery('.topEvt').find('i').on('click', function(){
        jQuery('.topEvt').fadeOut();
//        jQuery('#mainSpot').animate({
//            marginTop: '120px'
//        });
    });
    
    jQuery(window).scroll(function() {
        var scroll = jQuery(window).scrollTop(),
            _topEvt = jQuery('.topEvt').height();

        if (scroll > _topEvt ) {
            jQuery(".header").addClass("active");
        } else {
            jQuery(".header").removeClass("active");
        }
    });
    
    jQuery('.topEvt').slick({
        autoplay: true,
        arrows: false,
        dots: false,
        fade: true,
    })
    
});