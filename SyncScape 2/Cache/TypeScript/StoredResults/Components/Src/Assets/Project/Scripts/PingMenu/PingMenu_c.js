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
// @input AssignableType headLabelManager {"hint":"Reference to the head label manager to get all user head labels"}
// @input Asset.ObjectPrefab pingMenuPrefab {"hint":"PingMenu prefab to instantiate when receiving ping requests"}
// @input Component.AudioComponent pingSendAudio {"hint":"Audio component to play when sending a ping"}
// @input bool preferUserId {"hint":"Prefer UserId over ConnectionId for targeting. Enable for same user across devices, disable for device-specific targeting"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../../Modules/Src/Assets/Project/Scripts/PingMenu/PingMenu");
Object.setPrototypeOf(script, Module.PingMenu.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("headLabelManager", []);
    checkUndefined("pingMenuPrefab", []);
    checkUndefined("pingSendAudio", []);
    checkUndefined("preferUserId", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
