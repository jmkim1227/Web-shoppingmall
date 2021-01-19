var SpFramePush = function() {
    
    var _spFrame = this;
    this.FRAME_NAME = 'spm_frame_push_';
    this.frames;
    this.infokey;

    this.initFrameMessage = function () 
    {
        window.addEventListener("message", this.bindFrameMessageCallback, false);
    }

    this.bindFrameMessageCallback = function(event) 
    {
        try {
            if (event.origin.indexOf('snapfit') != -1) {
                var data = event.data;
                if (!data || !data.match(/^{.*}$/g)) {
                    return;
                }
                var values = JSON.parse(data);
                var params = values.params;
                if (values.e == 'init_framePush') {
                    _spFrame.frames = params.data.frames;
                    _spFrame.infokey = params.data.k;
                    _spFrame.makeFrames();
                } else if (values.e == 'spm_setFrameStyle') {
                    _spFrame.setFrameStyle(params.data);
                }
            }
        } catch (e) {

        }
    }
    
    this.makeFrames = function() 
    {
        _spFrame.frames.forEach(function(frame) {
            var target = frame.target;
            if (target.selector !== '' && target.index !== '' && document.querySelectorAll(target.selector)[target.index]) {
                var iframe = document.createElement("iframe");
                iframe.setAttribute("id", _spFrame.FRAME_NAME + frame.id);
                iframe.setAttribute("name", _spFrame.FRAME_NAME + frame.id);
                iframe.src = getServerInfo(false)+'frame/detail?' + _spFrame.infokey + '=' + frame.info;
                iframe.allowtransparency = true;
                iframe.frameBorder = 0;
                iframe.scrolling = 'no';
                iframe.style.setProperty('width', '100%');
                document.querySelectorAll(target.selector)[target.index].appendChild(iframe);
            }
        });        
    }

    this.setFrameStyle = function(data)
    {
        document.querySelector('#' + this.FRAME_NAME + data.frameid).style.setProperty('height', data.height + 'px');
    }


}

var spFramePush = new SpFramePush();
spFramePush.initFrameMessage();