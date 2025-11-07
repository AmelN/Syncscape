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
// @input vec3 minRotation = {-45,-45,-45} {"hint":"Minimum rotation values in degrees"}
// @input vec3 maxRotation = {45,45,45} {"hint":"Maximum rotation values in degrees"}
// @input vec3 minScale = {0.5,0.5,0.5} {"hint":"Minimum scale values"}
// @input vec3 maxScale = {2,2,2} {"hint":"Maximum scale values"}
// @input float animationTime = 1.5 {"hint":"Animation time in seconds for complete loop (A→B→A)", "widget":"slider", "min":0.5, "max":5, "step":0.1}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../../Modules/Src/Assets/Project/Scripts/HandMenu/AnimationTimer");
Object.setPrototypeOf(script, Module.AnimationTimer.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("minRotation", []);
    checkUndefined("maxRotation", []);
    checkUndefined("minScale", []);
    checkUndefined("maxScale", []);
    checkUndefined("animationTime", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
