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
// @input Component.Text textUserName {"hint":"Text component for user name"}
// @input Component.Text textStatus {"hint":"Text component for main status"}
// @input Component.Text textSubStatus {"hint":"Text component for sub status"}
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
var Module = require("../../../../../../Modules/Src/Assets/Project/Scripts/HeadLabel/HeadLabelReferences");
Object.setPrototypeOf(script, Module.HeadLabelReferences.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("textUserName", []);
    checkUndefined("textStatus", []);
    checkUndefined("textSubStatus", []);
    checkUndefined("pingDefaultMaterial", []);
    checkUndefined("pingAcceptedMaterial", []);
    checkUndefined("pingMaterialTargets", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
