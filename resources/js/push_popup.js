var SpPopup = function() {
    
    var _sp_popupSelf = this;
    this.zindex = "2020";
    this.popupTarget;
    this.frame;
    this.position;
    this.size;
    this.toggle;
    this.useToggle = '0';

    this.initPopupMessage = function () 
    {
        window.addEventListener("message", this.bindPopupMessageCallback, false);
    }

    this.bindPopupMessageCallback = function(event) 
    {
        try {
            if (event.origin.indexOf('snapfit') != -1) {
                var data = event.data;
                if (!data || !data.match(/^{.*}$/g)) {
                    return;
                }
                var values = JSON.parse(data);
                var params = values.params;
                if (values.e == 'spm_make_popup') {
                    _sp_popupSelf.makeSpmPopup(params);
                } else if (values.e == 'init_spm_popup') {
                    _sp_popupSelf.initSpmPopup(params);
                } else if (values.e == 'spm_displayPopup') {
                    _sp_popupSelf.displayPopup();
                } else if (values.e == 'spm_popup_close') {
                    _sp_popupSelf.close();
                } else if (values.e == 'spm_displayToggle') {
                    _sp_popupSelf.displayToggle();
                }
            }
        } catch (e) {

        }
    }
    
    this.makeSpmPopup = function(data) 
    {
        this.popupTarget = document.createElement("div");
        this.popupTarget.setAttribute("id","spm_popup_main");
        this.popupTarget.setAttribute("name","spm_popup_main");
        this.popupTarget.style.position = "fixed";
        this.popupTarget.style.visibility = "hidden";
        this.popupTarget.style.opacity = "0";
        this.popupTarget.style.zIndex = "0";
        this.popupTarget.style.width = "100%";
        this.popupTarget.style.height = "100%";
        this.popupTarget.style.setProperty('-webkit-animation-name','bounceInUp');
        this.popupTarget.style.setProperty('animation-name','bounceInUp');
        this.popupTarget.style.setProperty('-webkit-animation-duration','2s');
        this.popupTarget.style.setProperty('animation-duration','2s');

        this.frame = document.createElement("iframe");
        this.frame.setAttribute("id", 'spm_popup_frame_form');
        this.frame.setAttribute("name", "spm_popup_frame_form");
        this.frame.src = getServerInfo(false)+'Popup/show?q=' + encodeURIComponent(JSON.stringify(data));
        this.frame.style.width = "100%";
        this.frame.style.height = "100%";
        this.frame.allowtransparency = true;
        this.frame.style.border = "0";
        this.frame.style.frameborder = "0"
        
        this.popupTarget.appendChild(this.frame);
        document.querySelector('body').appendChild(this.popupTarget);

        this.customCss =  document.createElement("link");
        this.customCss.setAttribute("id","spm_popup_custom");
        this.customCss.setAttribute("href","");
        this.customCss.setAttribute("type","text/css");
        this.customCss.setAttribute("rel","stylesheet");
        document.head.appendChild(this.customCss);

        var ani =  document.createElement("link");
        ani.setAttribute("id","spm_popup_outter");
        ani.setAttribute("href","//cdn.snapfit.co.kr/css/push/animate.css");
        ani.setAttribute("type","text/css");
        ani.setAttribute("rel","stylesheet");        
        document.head.appendChild(ani);
    }

    this.initSpmPopup = function(data)
    {
        this.setCustomcss(data.custom_css);
        this.position = data.position;
        this.size = data.size;
        this.toggle = data.toggle;
        this.useToggle = data.use_toggle;
    }

    this.displayPopup = function() 
    {
        this.popupTarget.style.opacity = "1";
        this.popupTarget.style.zIndex = this.zindex;
        this.popupTarget.style.visibility = "visible";
        this.setPopupstyle({
            vertical: this.position.vertical,
            v_position: this.position.v_position,
            horizontal: this.position.horizontal,
            h_position: this.position.h_position,
            width: this.size.width,
            height: this.size.height
        });
        snap_sf_post_to_resultviewmessage(JSON.stringify({e: 'spm_displayPopup', params: {  }}), 'spm_popup_frame_form');
        setTimeout(function(){
            _sp_popupSelf.popupTarget.style.setProperty('-webkit-transition','width 0.2s, height 0.2s');
            _sp_popupSelf.popupTarget.style.transition = "width 0.2s, height 0.2s";
        }, 1000);
    }

    this.setPopupstyle = function(data)
    {
        if (data.vertical == 'top') {
            this.popupTarget.style['bottom'] = 'auto';
        } else {
            this.popupTarget.style['top'] = 'auto';
        }
        if (data.horizontal == 'left') {
            this.popupTarget.style['right'] = 'auto';
        } else {
            this.popupTarget.style['left'] = 'auto';
        }
        this.popupTarget.style[data.vertical] = data.v_position + 'px';
        this.popupTarget.style[data.horizontal] = data.h_position + 'px';
        this.popupTarget.style.width = data.width + 'px';
        this.popupTarget.style.height = data.height + 'px';
    }

    this.displayToggle = function()
    { 
        this.popupTarget.style.opacity = "1";
        this.popupTarget.style.zIndex = this.zindex;
        this.popupTarget.style.visibility = "visible";
        this.setPopupstyle(this.toggle);
        setTimeout(function(){
            _sp_popupSelf.popupTarget.style.setProperty('-webkit-transition','width 0.2s, height 0.2s');
            _sp_popupSelf.popupTarget.style.transition = "width 0.2s, height 0.2s";
        }, 1000);
    }

    this.setCustomcss = function(css)
    {
        this.customCss.setAttribute("href", css);
    }

    this.close = function()
    {
        this.popupTarget.style.display = 'none';
        this.setCustomcss('');
    }
}

var SpPopupInstance = new SpPopup();
SpPopupInstance.initPopupMessage();