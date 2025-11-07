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
// @input Asset.ObjectPrefab handMenuPrefab {"hint":"Hand menu prefab to instantiate"}
// @input Asset.ObjectPrefab timerPrefab {"hint":"Timer prefab to instantiate during delay period"}
// @input SceneObject headPoseTarget {"hint":"Head pose target for positioning calculations"}
// @input vec3 positionOffset = {0.3,0.1,0} {"hint":"Position offset from wrist (X, Y, Z)"}
// @input float showDelay = 0.5 {"hint":"Delay before showing menu when palm is detected (seconds)", "widget":"slider", "min":0.1, "max":3, "step":0.1}
// @input float hideDelay = 1 {"hint":"Delay before hiding menu when palm is lost (seconds)", "widget":"slider", "min":0.1, "max":3, "step":0.1}
// @input float initialScale {"hint":"Initial scale for menu (starting scale)", "widget":"slider", "min":0, "max":2, "step":0.1}
// @input float endScale = 1 {"hint":"End scale for menu (target scale)", "widget":"slider", "min":0.1, "max":3, "step":0.1}
// @input float animationTime = 0.5 {"hint":"Animation time for scaling and positioning (in seconds)", "widget":"slider", "min":0.1, "max":2, "step":0.1}
// @input bool enableScaling = true {"hint":"Enable scaling animation on reveal"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../../Modules/Src/Assets/Project/Scripts/HandMenu/HandMenu");
Object.setPrototypeOf(script, Module.HandMenu.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("handMenuPrefab", []);
    checkUndefined("timerPrefab", []);
    checkUndefined("headPoseTarget", []);
    checkUndefined("positionOffset", []);
    checkUndefined("showDelay", []);
    checkUndefined("hideDelay", []);
    checkUndefined("initialScale", []);
    checkUndefined("endScale", []);
    checkUndefined("animationTime", []);
    checkUndefined("enableScaling", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
