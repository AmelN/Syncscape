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
// @input vec3 positionOffset = {0,0,0} {"hint":"Position offset relative to the target's position"}
// @input bool usePositionLerp = true {"hint":"Use lerping for smooth position transitions"}
// @input float positionLerpSpeed = 8 {"hint":"Speed for moving towards the target's position (when lerping is enabled)", "widget":"slider", "min":0.1, "max":20, "step":0.1}
// @input bool useRotationLerp = true {"hint":"Use lerping for smooth rotation transitions"}
// @input float rotationLerpSpeed = 6 {"hint":"Speed for rotating towards the target's rotation (when lerping is enabled)", "widget":"slider", "min":0.1, "max":20, "step":0.1}
// @input bool matchRotation = true {"hint":"Whether to match the target's rotation"}
// @input bool matchScale {"hint":"Whether to match the target's scale"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../../Modules/Src/Assets/Project/Scripts/Utils/MatchTransform");
Object.setPrototypeOf(script, Module.MatchTransform.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("positionOffset", []);
    checkUndefined("usePositionLerp", []);
    checkUndefined("positionLerpSpeed", []);
    checkUndefined("useRotationLerp", []);
    checkUndefined("rotationLerpSpeed", []);
    checkUndefined("matchRotation", []);
    checkUndefined("matchScale", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
