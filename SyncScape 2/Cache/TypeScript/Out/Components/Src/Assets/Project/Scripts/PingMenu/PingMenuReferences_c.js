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
// @input AssignableType acceptButton {"hint":"Rectangle button for accepting ping requests"}
// @input AssignableType_1 rejectButton {"hint":"Rectangle button for rejecting ping requests"}
// @input Component.Text pingerNameText {"hint":"Text component showing who is pinging"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../../Modules/Src/Assets/Project/Scripts/PingMenu/PingMenuReferences");
Object.setPrototypeOf(script, Module.PingMenuReferences.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("acceptButton", []);
    checkUndefined("rejectButton", []);
    checkUndefined("pingerNameText", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
