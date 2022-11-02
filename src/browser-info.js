
var BrowserInfoPorts = function () { };

BrowserInfoPorts.prototype.subscribe =
    function (app, getBrowserPortName, responsePortName) {

        if (!getBrowserPortName) getPortName = "getBrowserInfoPort";
        if (!responsePortName) responsePortName = "browserInfoResponsePort";

        if (app.ports[responsePortName]) {

            var responsePort = app.ports[responsePortName];

            if (app.ports[getPortName]) {
                app.ports[getPortName].subscribe(function () {
                    responsePort.send(fnBrowserDetect());
                });
            } else {
                console.warn("The " + getPortName + " port is not connected.");
            }
        } else {
            console.warn("The " + responsePortName + " port is not connected.");
        }
    };

function fnBrowserDetect() {

    let userAgent = navigator.userAgent;
    let browserName;

    if (userAgent.match(/chrome|chromium|crios/i)) {
        browserName = "chrome";
    } else if (userAgent.match(/firefox|fxios/i)) {
        browserName = "firefox";
    } else if (userAgent.match(/safari/i)) {
        browserName = "safari";
    } else if (userAgent.match(/opr\//i)) {
        browserName = "opera";
    } else if (userAgent.match(/edg/i)) {
        browserName = "edge";
    } else {
        browserName = "No browser detection";
    }

    return browserName;
}

module.exports.BrowserInfoPorts = BrowserInfoPorts;
