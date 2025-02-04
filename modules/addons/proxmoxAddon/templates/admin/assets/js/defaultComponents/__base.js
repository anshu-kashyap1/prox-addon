/*
 * Core js fw functions
 * Do not edit this file 
 */

/* 
 * Set body Id for Layers js/css
 */
$('body').attr('id', 'layers-body');


/* 
 * Init app on page loaded (supports ie11+)
 */
function mgLoadPageContoler() {
    mgJsComponentHandler.registerComponents();
    var appContainers = document.getElementsByClassName("vue-app-main-container");
    mgEventHandler.runCallback('AppsPreLoad', null, {appContainers: appContainers});
    for (var i = 0; i < appContainers.length; i++) {
        mgPageControler = new mgVuePageControler(appContainers[i].id);
        mgPageControler.vinit();
    }
}
;



/* 
 * Url Helper
 */
var mgUrlParser = {
    url: null,

    getCurrentUrl: function () {
        if (!this.url) {
            if (window.location.href.indexOf('#') > 0) {
                this.url = window.location.href.substr(0, window.location.href.indexOf('#'));
            } else {
                this.url = window.location.href;
            }
        }

        return this.url;
    }
};

document.addEventListener('readystatechange',  function (event) {
    if (document.readyState === "interactive"  ) {
        document.removeEventListener('readystatechange', this);
        mgLoadPageContoler();
    }
});
