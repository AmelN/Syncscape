if (script.onAwake) {
    script.onAwake();
    return;
}
function checkUndefined(property, showIfData) {
    for (var i = 0; i < showIfData.length; i++) {
        if (showIfData[i][0] && script[showIfData[i][0]] != showIfData[i][1]) {
            return;
        }
    }
    if (script[property] == undefined) {
        throw new Error("Input " + property + " was not provided for the object " + script.getSceneObject().name);
    }
}
// @input AssignableType handMenu {"hint":"Reference to the HandMenu component to activate"}
// @input bool enableTapToShow = true {"hint":"Enable tap to show hand menu (for testing)"}
// @input bool enableTapToExitPing {"hint":"Enable tap to exit ping connections (for testing)"}
// @input AssignableType_1 pingMenu {"hint":"Reference to the PingMenu component for exit ping testing"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../../Modules/Src/Assets/Project/Scripts/Utils/HandMenuTester");
Object.setPrototypeOf(script, Module.HandMenuTester.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("handMenu", []);
    checkUndefined("enableTapToShow", []);
    checkUndefined("enableTapToExitPing", []);
    checkUndefined("pingMenu", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
