"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.setAlpha = exports.getPasses = void 0;
exports.animateToAlpha = animateToAlpha;
const animate_1 = require("SpectaclesInteractionKit.lspkg/Utils/animate");
const mathUtils_1 = require("SpectaclesInteractionKit.lspkg/Utils/mathUtils");
// This file provides utility functions for managing and animating the
// alpha (transparency) values of scene objects in a virtual environment
// Retrieves the main passes of a scene object's render mesh or image component
const getPasses = (object) => {
    const meshComponent = object.getComponents("Component.RenderMeshVisual");
    const imageComponent = object.getComponents("Component.Image");
    if (meshComponent.length > 0) {
        const mesh = (object.getComponent("Component.RenderMeshVisual"));
        const res = [];
        for (let i = 0; i < mesh.getMaterialsCount(); ++i) {
            res.push(mesh.getMaterial(i).mainPass);
        }
        return res;
    }
    else if (imageComponent.length > 0) {
        const image = object.getComponent("Component.Image");
        return [image.mainMaterial.mainPass];
    }
    return null;
};
exports.getPasses = getPasses;
// Sets the alpha value for a scene object and its children recursively
const setAlpha = (object, alpha) => {
    const pass = (0, exports.getPasses)(object);
    if (pass) {
        pass.forEach((value) => {
            const baseColor = value.baseColor;
            if (baseColor) {
                baseColor.a = alpha;
                value.baseColor = baseColor;
            }
        });
    }
    else if (object.getComponents("Component.Text").length > 0) {
        const text = object.getComponent("Component.Text");
        const baseColor = text.textFill.color;
        baseColor.a = alpha;
        text.textFill.color = baseColor;
        if (text.outlineSettings.enabled) {
            text.outlineSettings.fill.color = baseColor;
        }
    }
    // Recursively set alpha for child objects
    for (let i = 0; i < object.getChildrenCount(); ++i) {
        const child = object.getChild(i);
        (0, exports.setAlpha)(child, alpha);
    }
};
exports.setAlpha = setAlpha;
// Animates the alpha value of a scene object from a start value to an end value
function animateToAlpha(target, from, to, duration, onComplete = () => { }) {
    return (0, animate_1.default)({
        update: (t) => {
            const currentAlpha = (0, mathUtils_1.lerp)(from, to, t);
            (0, exports.setAlpha)(target, currentAlpha);
        },
        start: 0,
        end: 1,
        duration: duration,
        ended: onComplete,
    });
}
//# sourceMappingURL=SharedFunctions.js.map