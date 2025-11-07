"use strict";
var __esDecorate = (this && this.__esDecorate) || function (ctor, descriptorIn, decorators, contextIn, initializers, extraInitializers) {
    function accept(f) { if (f !== void 0 && typeof f !== "function") throw new TypeError("Function expected"); return f; }
    var kind = contextIn.kind, key = kind === "getter" ? "get" : kind === "setter" ? "set" : "value";
    var target = !descriptorIn && ctor ? contextIn["static"] ? ctor : ctor.prototype : null;
    var descriptor = descriptorIn || (target ? Object.getOwnPropertyDescriptor(target, contextIn.name) : {});
    var _, done = false;
    for (var i = decorators.length - 1; i >= 0; i--) {
        var context = {};
        for (var p in contextIn) context[p] = p === "access" ? {} : contextIn[p];
        for (var p in contextIn.access) context.access[p] = contextIn.access[p];
        context.addInitializer = function (f) { if (done) throw new TypeError("Cannot add initializers after decoration has completed"); extraInitializers.push(accept(f || null)); };
        var result = (0, decorators[i])(kind === "accessor" ? { get: descriptor.get, set: descriptor.set } : descriptor[key], context);
        if (kind === "accessor") {
            if (result === void 0) continue;
            if (result === null || typeof result !== "object") throw new TypeError("Object expected");
            if (_ = accept(result.get)) descriptor.get = _;
            if (_ = accept(result.set)) descriptor.set = _;
            if (_ = accept(result.init)) initializers.unshift(_);
        }
        else if (_ = accept(result)) {
            if (kind === "field") initializers.unshift(_);
            else descriptor[key] = _;
        }
    }
    if (target) Object.defineProperty(target, contextIn.name, descriptor);
    done = true;
};
var __runInitializers = (this && this.__runInitializers) || function (thisArg, initializers, value) {
    var useValue = arguments.length > 2;
    for (var i = 0; i < initializers.length; i++) {
        value = useValue ? initializers[i].call(thisArg, value) : initializers[i].call(thisArg);
    }
    return useValue ? value : void 0;
};
var __setFunctionName = (this && this.__setFunctionName) || function (f, name, prefix) {
    if (typeof name === "symbol") name = name.description ? "[".concat(name.description, "]") : "";
    return Object.defineProperty(f, "name", { configurable: true, value: prefix ? "".concat(prefix, " ", name) : name });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AnimationTimer = void 0;
var __selfType = requireType("./AnimationTimer");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const RotationInterpolationType_1 = require("LSTween.lspkg/RotationInterpolationType");
const Easing_1 = require("LSTween.lspkg/TweenJS/Easing");
const LSTween_1 = require("LSTween.lspkg/LSTween");
/**
 * AnimationTimer - Animates scale and rotation with looping
 * Animates from A to B and back to A continuously
 */
let AnimationTimer = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var AnimationTimer = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.minRotation = this.minRotation;
            this.maxRotation = this.maxRotation;
            this.minScale = this.minScale;
            this.maxScale = this.maxScale;
            this.animationTime = this.animationTime;
            this.isAnimating = false;
            this.currentScaleTween = null;
            this.currentRotationTween = null;
        }
        __initialize() {
            super.__initialize();
            this.minRotation = this.minRotation;
            this.maxRotation = this.maxRotation;
            this.minScale = this.minScale;
            this.maxScale = this.maxScale;
            this.animationTime = this.animationTime;
            this.isAnimating = false;
            this.currentScaleTween = null;
            this.currentRotationTween = null;
        }
        onAwake() {
            this.transform = this.getTransform();
            if (!this.transform) {
                print("AnimationTimer: No transform found on object");
                return;
            }
            // Set initial values
            this.transform.setLocalScale(this.minScale);
            this.transform.setLocalPosition(new vec3(0, 0, 0));
            // Start animation
            this.startAnimation();
        }
        onEnable() {
            // Restart animation when object is enabled
            this.resetToInitial();
            this.startAnimation();
            print("AnimationTimer: Object enabled - animation restarted");
        }
        startAnimation() {
            if (this.isAnimating) {
                return;
            }
            this.isAnimating = true;
            this.animateToMax();
        }
        animateToMax() {
            if (!this.isAnimating) {
                return;
            }
            print("AnimationTimer: Animating to max values");
            // Convert rotation degrees to radians
            const startRotation = quat.fromEulerAngles(this.minRotation.x * MathUtils.DegToRad, this.minRotation.y * MathUtils.DegToRad, this.minRotation.z * MathUtils.DegToRad);
            const endRotation = quat.fromEulerAngles(this.maxRotation.x * MathUtils.DegToRad, this.maxRotation.y * MathUtils.DegToRad, this.maxRotation.z * MathUtils.DegToRad);
            // Set initial rotation
            this.transform.setLocalRotation(startRotation);
            // Calculate half time for each direction
            const halfTime = (this.animationTime * 1000) / 2;
            // Animate scale to max
            this.currentScaleTween = LSTween_1.LSTween.scaleFromToLocal(this.transform, this.minScale, this.maxScale, halfTime)
                .easing(Easing_1.default.Circular.InOut)
                .onStart(() => {
                print("AnimationTimer: Scale animation to max started");
            })
                .onComplete(() => {
                print("AnimationTimer: Scale animation to max completed");
                this.animateToMin();
            })
                .start();
            // Animate rotation to max
            this.currentRotationTween = LSTween_1.LSTween.rotateFromToLocal(this.transform, startRotation, endRotation, halfTime, RotationInterpolationType_1.RotationInterpolationType.SLERP)
                .easing(Easing_1.default.Cubic.In)
                .onStart(() => {
                print("AnimationTimer: Rotation animation to max started");
            })
                .onComplete(() => {
                print("AnimationTimer: Rotation animation to max completed");
            })
                .start();
        }
        animateToMin() {
            if (!this.isAnimating) {
                return;
            }
            print("AnimationTimer: Animating to min values");
            // Convert rotation degrees to radians
            const startRotation = quat.fromEulerAngles(this.maxRotation.x * MathUtils.DegToRad, this.maxRotation.y * MathUtils.DegToRad, this.maxRotation.z * MathUtils.DegToRad);
            const endRotation = quat.fromEulerAngles(this.minRotation.x * MathUtils.DegToRad, this.minRotation.y * MathUtils.DegToRad, this.minRotation.z * MathUtils.DegToRad);
            // Set initial rotation
            this.transform.setLocalRotation(startRotation);
            // Calculate half time for each direction
            const halfTime = (this.animationTime * 1000) / 2;
            // Animate scale to min
            this.currentScaleTween = LSTween_1.LSTween.scaleFromToLocal(this.transform, this.maxScale, this.minScale, halfTime)
                .easing(Easing_1.default.Circular.InOut)
                .onStart(() => {
                print("AnimationTimer: Scale animation to min started");
            })
                .onComplete(() => {
                print("AnimationTimer: Scale animation to min completed");
                print("AnimationTimer: Complete loop finished");
                this.isAnimating = false;
            })
                .start();
            // Animate rotation to min
            this.currentRotationTween = LSTween_1.LSTween.rotateFromToLocal(this.transform, startRotation, endRotation, halfTime, RotationInterpolationType_1.RotationInterpolationType.SLERP)
                .easing(Easing_1.default.Cubic.In)
                .onStart(() => {
                print("AnimationTimer: Rotation animation to min started");
            })
                .onComplete(() => {
                print("AnimationTimer: Rotation animation to min completed");
            })
                .start();
        }
        /**
         * Stop the animation
         */
        stopAnimation() {
            this.isAnimating = false;
            if (this.currentScaleTween) {
                this.currentScaleTween.stop();
                this.currentScaleTween = null;
            }
            if (this.currentRotationTween) {
                this.currentRotationTween.stop();
                this.currentRotationTween = null;
            }
            print("AnimationTimer: Animation stopped");
        }
        /**
         * Start the animation
         */
        startAnimationManually() {
            this.startAnimation();
        }
        /**
         * Reset to initial state
         */
        resetToInitial() {
            this.stopAnimation();
            this.transform.setLocalScale(this.minScale);
            const initialRotation = quat.fromEulerAngles(this.minRotation.x * MathUtils.DegToRad, this.minRotation.y * MathUtils.DegToRad, this.minRotation.z * MathUtils.DegToRad);
            this.transform.setLocalRotation(initialRotation);
            print("AnimationTimer: Reset to initial state");
        }
    };
    __setFunctionName(_classThis, "AnimationTimer");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        AnimationTimer = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return AnimationTimer = _classThis;
})();
exports.AnimationTimer = AnimationTimer;
//# sourceMappingURL=AnimationTimer.js.map