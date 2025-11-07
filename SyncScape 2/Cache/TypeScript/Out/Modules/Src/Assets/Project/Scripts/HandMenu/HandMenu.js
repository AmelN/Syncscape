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
exports.HandMenu = void 0;
var __selfType = requireType("./HandMenu");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const SIK_1 = require("SpectaclesInteractionKit.lspkg/SIK");
const LSTween_1 = require("LSTween.lspkg/LSTween");
const Easing_1 = require("LSTween.lspkg/TweenJS/Easing");
const MatchTransform_1 = require("../Utils/MatchTransform");
const AnimationTimer_1 = require("./AnimationTimer");
/**
 * Simple Hand Menu Controller
 * Instantiates hand menu at wrist position when right hand palm is facing camera
 * Uses direct positioning logic similar to MenuPositioner
 */
let HandMenu = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var HandMenu = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.handMenuPrefab = this.handMenuPrefab;
            this.timerPrefab = this.timerPrefab;
            this.headPoseTarget = this.headPoseTarget;
            this.positionOffset = this.positionOffset;
            this.showDelay = this.showDelay;
            this.hideDelay = this.hideDelay;
            this.initialScale = this.initialScale;
            this.endScale = this.endScale;
            this.animationTime = this.animationTime;
            this.enableScaling = this.enableScaling;
            this.currentHandMenu = null;
            this.currentTimer = null; // Instantiated timer object
            this.timerMatchTransform = null; // MatchTransform component on timer
            this.wristTargetObject = null; // Target object for timer positioning
            this.isShowingPalm = false;
            this.showDelayedEvent = null;
            this.hideDelayedEvent = null;
        }
        __initialize() {
            super.__initialize();
            this.handMenuPrefab = this.handMenuPrefab;
            this.timerPrefab = this.timerPrefab;
            this.headPoseTarget = this.headPoseTarget;
            this.positionOffset = this.positionOffset;
            this.showDelay = this.showDelay;
            this.hideDelay = this.hideDelay;
            this.initialScale = this.initialScale;
            this.endScale = this.endScale;
            this.animationTime = this.animationTime;
            this.enableScaling = this.enableScaling;
            this.currentHandMenu = null;
            this.currentTimer = null; // Instantiated timer object
            this.timerMatchTransform = null; // MatchTransform component on timer
            this.wristTargetObject = null; // Target object for timer positioning
            this.isShowingPalm = false;
            this.showDelayedEvent = null;
            this.hideDelayedEvent = null;
        }
        onAwake() {
            this.createEvent("OnStartEvent").bind(() => {
                this.onStart();
            });
            this.createEvent("UpdateEvent").bind(this.onUpdate.bind(this));
        }
        onStart() {
            // Initialize hand tracking
            this.initializeHands();
            // Initialize timer with MatchTransform
            this.initializeTimer();
            print("HandMenu: Initialized hand tracking and timer");
        }
        initializeHands() {
            try {
                this.leftHand = SIK_1.SIK.HandInputData.getHand("left");
                this.rightHand = SIK_1.SIK.HandInputData.getHand("right");
                print("HandMenu: Hands initialized successfully");
            }
            catch (error) {
                print("HandMenu: Error initializing hands - " + error);
            }
        }
        initializeTimer() {
            if (!this.timerPrefab) {
                print("HandMenu: No timer prefab assigned");
                return;
            }
            // Create wrist target object for timer positioning
            this.wristTargetObject = global.scene.createSceneObject("WristTarget");
            print("HandMenu: Timer system initialized - ready to instantiate timer prefab");
        }
        onUpdate() {
            if (!this.leftHand || !this.rightHand) {
                return;
            }
            // Update wrist target position continuously
            if (this.wristTargetObject && this.rightHand.isTracked) {
                this.wristTargetObject.getTransform().setWorldPosition(this.rightHand.indexKnuckle.position);
            }
            // Check if right hand is showing palm
            const isRightPalmShowing = this.rightHand.isTracked && this.rightHand.isFacingCamera();
            if (isRightPalmShowing && !this.isShowingPalm) {
                // Only show timer if menu is not already visible
                if (!this.currentHandMenu || !this.currentHandMenu.enabled) {
                    this.isShowingPalm = true;
                    this.cancelHideDelay();
                    this.scheduleShowMenu();
                }
            }
            else if (!isRightPalmShowing && this.isShowingPalm) {
                // Stopped showing palm - but don't hide menu, just stop showing timer
                this.isShowingPalm = false;
                this.cancelHideDelay();
                // Don't schedule hide menu - keep menu visible
            }
        }
        scheduleShowMenu() {
            if (this.showDelayedEvent) {
                return; // Already scheduled
            }
            print("HandMenu: Scheduling menu show with delay: " + this.showDelay + "s");
            // Show timer during delay
            this.showTimer();
            this.showDelayedEvent = this.createEvent("DelayedCallbackEvent");
            this.showDelayedEvent.bind(() => {
                this.hideTimer();
                this.showMenu();
                this.showDelayedEvent = null;
            });
            this.showDelayedEvent.reset(this.showDelay);
        }
        scheduleHideMenu() {
            if (this.hideDelayedEvent) {
                return; // Already scheduled
            }
            print("HandMenu: Scheduling menu hide with delay: " + this.hideDelay + "s");
            this.hideDelayedEvent = this.createEvent("DelayedCallbackEvent");
            this.hideDelayedEvent.bind(() => {
                this.hideMenu();
                this.hideDelayedEvent = null;
            });
            this.hideDelayedEvent.reset(this.hideDelay);
        }
        cancelShowDelay() {
            if (this.showDelayedEvent) {
                this.showDelayedEvent.enabled = false;
                this.showDelayedEvent = null;
                this.hideTimer();
                print("HandMenu: Cancelled show delay and hid timer");
            }
        }
        cancelHideDelay() {
            if (this.hideDelayedEvent) {
                this.hideDelayedEvent.enabled = false;
                this.hideDelayedEvent = null;
                print("HandMenu: Cancelled hide delay");
            }
        }
        showTimer() {
            if (!this.timerPrefab) {
                print("HandMenu: No timer prefab assigned");
                return;
            }
            // Reuse existing timer or instantiate new one
            if (!this.currentTimer) {
                this.currentTimer = this.timerPrefab.instantiate(null);
                if (!this.currentTimer) {
                    print("HandMenu: Failed to instantiate timer prefab");
                    return;
                }
                // Get or create MatchTransform component on timer
                this.timerMatchTransform = this.currentTimer.getComponent(MatchTransform_1.MatchTransform.getTypeName());
                if (!this.timerMatchTransform) {
                    this.timerMatchTransform = this.currentTimer.createComponent(MatchTransform_1.MatchTransform.getTypeName());
                    print("HandMenu: Created MatchTransform component on timer");
                }
                // Set timer target to wrist target object
                this.timerMatchTransform.target = this.wristTargetObject;
                this.timerMatchTransform.positionOffset = new vec3(0, 0, 0); // No offset for timer
            }
            this.currentTimer.enabled = true;
            // Restart timer animation each time
            const animationTimer = this.currentTimer.getComponent(AnimationTimer_1.AnimationTimer.getTypeName());
            if (animationTimer) {
                // Call the public method to restart animation
                animationTimer.startAnimationManually();
                print("HandMenu: Timer animation restarted");
            }
            print("HandMenu: Timer shown");
        }
        hideTimer() {
            if (!this.currentTimer) {
                return;
            }
            this.currentTimer.enabled = false;
            print("HandMenu: Timer hidden");
        }
        showMenu() {
            if (this.currentHandMenu && this.currentHandMenu.enabled) {
                print("HandMenu: Menu already visible");
                return;
            }
            if (!this.handMenuPrefab) {
                print("HandMenu: No hand menu prefab assigned");
                return;
            }
            if (!this.rightHand.isTracked) {
                print("HandMenu: Right hand not tracked, cannot show menu");
                return;
            }
            // Reuse existing menu or instantiate new one
            if (!this.currentHandMenu) {
                this.currentHandMenu = this.handMenuPrefab.instantiate(null);
                if (!this.currentHandMenu) {
                    print("HandMenu: Failed to instantiate menu");
                    return;
                }
            }
            // Enable and position menu
            this.currentHandMenu.enabled = true;
            this.positionMenuAtWrist();
            print("HandMenu: Menu shown at wrist position with offset");
        }
        /**
         * Position menu at hand position initially, then animate to offset position with scaling
         */
        positionMenuAtWrist() {
            if (!this.currentHandMenu) {
                return;
            }
            if (!this.headPoseTarget) {
                print("HandMenu: No head pose target assigned for menu positioning");
                return;
            }
            if (!this.rightHand.isTracked) {
                print("HandMenu: Right hand not tracked for positioning");
                return;
            }
            // Get hand position (starting position)
            const handPosition = this.rightHand.indexKnuckle.position;
            // Calculate target position using head pose target as base
            const targetPosition = this.calculatePositionWithOffset(this.headPoseTarget.getTransform().getWorldPosition(), this.positionOffset);
            if (!targetPosition) {
                print("HandMenu: Could not calculate position");
                return;
            }
            // Enable menu
            this.currentHandMenu.enabled = true;
            print("HandMenu: Menu object enabled");
            // Position menu at hand position initially
            this.currentHandMenu.getTransform().setWorldPosition(handPosition);
            print(`HandMenu: Positioned at hand - ${handPosition.x.toFixed(2)}, ${handPosition.y.toFixed(2)}, ${handPosition.z.toFixed(2)}`);
            // Handle scaling and positioning animation based on enableScaling setting
            if (this.enableScaling) {
                this.animateScaleAndPosition(handPosition, targetPosition);
            }
            else {
                // Set menu to end scale and target position immediately (no animation)
                const menuTransform = this.currentHandMenu.getTransform();
                const fullScale = new vec3(this.endScale, this.endScale, this.endScale);
                menuTransform.setLocalScale(fullScale);
                menuTransform.setWorldPosition(targetPosition);
                print(`HandMenu: Menu scale set to ${this.endScale} and positioned at target immediately (animation disabled)`);
            }
        }
        /**
         * Calculate the target position based on head pose position and offset (like MenuPositioner)
         */
        calculatePositionWithOffset(headPosition, offset) {
            if (!this.headPoseTarget) {
                print("HandMenu: No head pose target for position calculation");
                return null;
            }
            const headTransform = this.headPoseTarget.getTransform();
            const headPos = headTransform.getWorldPosition();
            // Get head rotation for orientation
            const headRotation = headTransform.getWorldRotation();
            // Get the forward direction from head pose
            const forward = this.getForwardVector(headRotation);
            const flattenedForward = this.normalizeVector(new vec3(forward.x, 0, forward.z));
            // Get the right direction from head pose
            const right = this.getRightVector(headRotation);
            const flattenedRight = this.normalizeVector(new vec3(right.x, 0, right.z));
            // Calculate new position using the flattened directions (like MenuPositioner)
            return new vec3(headPos.x + flattenedRight.x * offset.x + offset.y * 0 + flattenedForward.x * offset.z, headPos.y + flattenedRight.y * offset.x + offset.y * 1 + flattenedForward.y * offset.z, headPos.z + flattenedRight.z * offset.x + offset.y * 0 + flattenedForward.z * offset.z);
        }
        /**
         * Animate menu scale and position simultaneously from hand to offset position
         */
        animateScaleAndPosition(startPosition, endPosition) {
            if (!this.currentHandMenu) {
                print("HandMenu: No menu object for scale and position animation");
                return;
            }
            const menuTransform = this.currentHandMenu.getTransform();
            const startScale = new vec3(this.initialScale, this.initialScale, this.initialScale);
            const endScale = new vec3(this.endScale, this.endScale, this.endScale);
            const duration = this.animationTime * 1000; // Convert to milliseconds
            // Set initial scale
            menuTransform.setLocalScale(startScale);
            // Animate scale and position simultaneously
            LSTween_1.LSTween.scaleToLocal(menuTransform, endScale, duration)
                .easing(Easing_1.default.Quadratic.Out)
                .start();
            LSTween_1.LSTween.moveToWorld(menuTransform, endPosition, duration)
                .easing(Easing_1.default.Quadratic.Out)
                .onComplete(() => {
                print(`HandMenu: Scale and position animation completed - menu at scale ${this.endScale} and target position`);
            })
                .start();
            print(`HandMenu: Started scale and position animation from ${this.initialScale} to ${this.endScale} over ${this.animationTime}s`);
            print(`HandMenu: Animating from hand position to offset position over ${this.animationTime}s`);
        }
        /**
         * Get the forward vector from a rotation
         */
        getForwardVector(rotation) {
            return this.rotateVectorByQuaternion(new vec3(0, 0, 1), rotation);
        }
        /**
         * Get the right vector from a rotation
         */
        getRightVector(rotation) {
            return this.rotateVectorByQuaternion(new vec3(1, 0, 0), rotation);
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
        /**
         * Normalize a vector to unit length
         */
        normalizeVector(v) {
            const length = Math.sqrt(v.x * v.x + v.y * v.y + v.z * v.z);
            if (length < 0.0001) {
                return new vec3(0, 0, 0);
            }
            return new vec3(v.x / length, v.y / length, v.z / length);
        }
        hideMenu() {
            if (!this.currentHandMenu) {
                return;
            }
            print("HandMenu: Hiding menu");
            this.currentHandMenu.enabled = false;
            // Don't set to null - keep for reuse
        }
        /**
         * Public method to manually show menu (for testing)
         */
        showMenuManually() {
            this.cancelHideDelay();
            this.scheduleShowMenu();
        }
        /**
         * Public method to manually hide menu
         */
        hideMenuManually() {
            this.cancelShowDelay();
            this.scheduleHideMenu();
        }
    };
    __setFunctionName(_classThis, "HandMenu");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        HandMenu = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return HandMenu = _classThis;
})();
exports.HandMenu = HandMenu;
//# sourceMappingURL=HandMenu.js.map