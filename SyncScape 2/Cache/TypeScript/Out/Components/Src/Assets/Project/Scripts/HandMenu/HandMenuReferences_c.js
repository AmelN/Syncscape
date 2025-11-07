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
// @input AssignableType textStatusInputField {"hint":"Text input field for status text"}
// @input AssignableType_1 exitPingButton {"hint":"Rectangle button for exiting ping connections"}
// @input AssignableType_2 closeButton {"hint":"Rectangle button for interactions"}
// @input AssignableType_3 updateStatusButton {"hint":"Rectangle button for interactions"}
// @input AssignableType_4 switchToggleGroupSubStatus {"hint":"Switch toggle group for status options"}
// @input Asset.Material pingDefaultMaterial {"hint":"Default material for normal/denied ping state"}
// @input Asset.Material pingAcceptedMaterial {"hint":"Material for accepted ping state"}
// @input SceneObject[] pingMaterialTargets = {} {"hint":"Array of scene objects with MeshRenderVisual for ping material swapping"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../../Modules/Src/Assets/Project/Scripts/HandMenu/HandMenuReferences");
Object.setPrototypeOf(script, Module.HandMenuReferences.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("textStatusInputField", []);
    checkUndefined("exitPingButton", []);
    checkUndefined("closeButton", []);
    checkUndefined("updateStatusButton", []);
    checkUndefined("switchToggleGroupSubStatus", []);
    checkUndefined("pingDefaultMaterial", []);
    checkUndefined("pingAcceptedMaterial", []);
    checkUndefined("pingMaterialTargets", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
