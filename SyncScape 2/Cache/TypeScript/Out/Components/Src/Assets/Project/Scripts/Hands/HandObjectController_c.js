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
// @input AssignableType handObjectManager
// @input string handType = "left"
// @input bool testingMode
// @input Asset.Material[] handColorMaterials = {} {"hint":"Array of materials for different hand colors"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../../Modules/Src/Assets/Project/Scripts/Hands/HandObjectController");
Object.setPrototypeOf(script, Module.HandObjectController.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("handObjectManager", []);
    checkUndefined("handType", []);
    checkUndefined("testingMode", []);
    checkUndefined("handColorMaterials", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
