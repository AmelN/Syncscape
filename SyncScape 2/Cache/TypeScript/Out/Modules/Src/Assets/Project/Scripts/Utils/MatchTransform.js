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
exports.MatchTransform = void 0;
var __selfType = requireType("./MatchTransform");
function component(target) { target.getTypeName = function () { return __selfType; }; }
/**
 * MatchTransform - Simple utility to match transform of one object to another
 * Used for positioning timer and menu objects
 */
let MatchTransform = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var MatchTransform = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.positionOffset = this.positionOffset;
            this.usePositionLerp = this.usePositionLerp;
            this.positionLerpSpeed = this.positionLerpSpeed;
            this.useRotationLerp = this.useRotationLerp;
            this.rotationLerpSpeed = this.rotationLerpSpeed;
            this.matchRotation = this.matchRotation;
            this.matchScale = this.matchScale;
        }
        __initialize() {
            super.__initialize();
            this.positionOffset = this.positionOffset;
            this.usePositionLerp = this.usePositionLerp;
            this.positionLerpSpeed = this.positionLerpSpeed;
            this.useRotationLerp = this.useRotationLerp;
            this.rotationLerpSpeed = this.rotationLerpSpeed;
            this.matchRotation = this.matchRotation;
            this.matchScale = this.matchScale;
        }
        onAwake() {
            this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
        }
        onUpdate() {
            if (!this.target) {
                return; // Target will be set programmatically by HandMenu
            }
            this.updateTransform();
        }
        updateTransform() {
            const myTransform = this.getTransform();
            const targetTransform = this.target.getTransform();
            // Update Position with proper local offset
            const targetPos = targetTransform.getWorldPosition();
            const targetRot = targetTransform.getWorldRotation();
            // Transform offset by target's rotation to get local space offset
            const rotatedOffset = this.rotateVectorByQuaternion(this.positionOffset, targetRot);
            const finalPos = new vec3(targetPos.x + rotatedOffset.x, targetPos.y + rotatedOffset.y, targetPos.z + rotatedOffset.z);
            const currentPos = myTransform.getWorldPosition();
            let newPos = this.usePositionLerp
                ? this.lerpVector(currentPos, finalPos, this.positionLerpSpeed * getDeltaTime())
                : finalPos;
            myTransform.setWorldPosition(newPos);
            // Update Rotation
            if (this.matchRotation) {
                const currentRot = myTransform.getWorldRotation();
                let newRot = this.useRotationLerp
                    ? quat.slerp(currentRot, targetRot, this.rotationLerpSpeed * getDeltaTime())
                    : targetRot;
                myTransform.setWorldRotation(newRot);
            }
            // Update Scale (optional)
            if (this.matchScale) {
                const targetScale = targetTransform.getWorldScale();
                const currentScale = myTransform.getLocalScale();
                let newScale = this.lerpVector(currentScale, targetScale, this.positionLerpSpeed * getDeltaTime());
                myTransform.setLocalScale(newScale);
            }
        }
        lerpVector(a, b, t) {
            const clampedT = Math.max(0, Math.min(1, t));
            return new vec3(a.x + (b.x - a.x) * clampedT, a.y + (b.y - a.y) * clampedT, a.z + (b.z - a.z) * clampedT);
        }
        /**
         * Set target programmatically
         */
        setTarget(target) {
            this.target = target;
        }
        /**
         * Set position offset programmatically
         */
        setPositionOffset(offset) {
            this.positionOffset = offset;
        }
        /**
         * Rotate a vector by a quaternion
         */
        rotateVectorByQuaternion(vector, rotation) {
            const x = rotation.x;
            const y = rotation.y;
            const z = rotation.z;
            const w = rotation.w;
            // Apply the quaternion rotation to the vector
            const ix = w * vector.x + y * vector.z - z * vector.y;
            const iy = w * vector.y + z * vector.x - x * vector.z;
            const iz = w * vector.z + x * vector.y - y * vector.x;
            const iw = -x * vector.x - y * vector.y - z * vector.z;
            const result = new vec3(ix * w + iw * -x + iy * -z - iz * -y, iy * w + iw * -y + iz * -x - ix * -z, iz * w + iw * -z + ix * -y - iy * -x);
            return result;
        }
    };
    __setFunctionName(_classThis, "MatchTransform");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        MatchTransform = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return MatchTransform = _classThis;
})();
exports.MatchTransform = MatchTransform;
//# sourceMappingURL=MatchTransform.js.map