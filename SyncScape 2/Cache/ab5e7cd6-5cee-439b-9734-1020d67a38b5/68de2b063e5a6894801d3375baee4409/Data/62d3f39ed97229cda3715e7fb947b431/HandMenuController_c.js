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
// @input AssignableType handMenuReferences {"hint":"Reference to the hand menu UI components"}
// @input string[] defaultStatusMessages = {"Ready to connect!","Open for collaboration","Looking for teammates","Exploring ideas","Building something cool"} {"hint":"Default status messages"}
// @input string[] subStatusOptions = {"Available","Busy","Away","Do Not Disturb"} {"hint":"Sub-status options"}
// @input AssignableType_1 pingMenu {"hint":"Reference to the ping menu"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../../Modules/Src/Assets/Project/Scripts/HandMenu/HandMenuController");
Object.setPrototypeOf(script, Module.HandMenuController.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("handMenuReferences", []);
    checkUndefined("defaultStatusMessages", []);
    checkUndefined("subStatusOptions", []);
    checkUndefined("pingMenu", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
