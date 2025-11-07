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
exports.HandObjectController = void 0;
var __selfType = requireType("./HandObjectController");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const SyncEntity_1 = require("SpectaclesSyncKit.lspkg/Core/SyncEntity");
const WorldCameraFinderProvider_1 = require("SpectaclesInteractionKit.lspkg/Providers/CameraProvider/WorldCameraFinderProvider");
const SIK_1 = require("SpectaclesInteractionKit.lspkg/SIK");
const PlayerColorAssigner_1 = require("../Utils/PlayerColorAssigner");
let HandObjectController = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var HandObjectController = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.handObjectManager = this.handObjectManager;
            this.handType = this.handType; // "left" or "right"
            this.testingMode = this.testingMode;
            this.handColorMaterials = this.handColorMaterials;
            this.syncEntity = new SyncEntity_1.SyncEntity(this);
            this.cameraTransform = WorldCameraFinderProvider_1.default.getInstance().getTransform();
            this.transform = this.sceneObject.getTransform();
            this.previousPos = new vec3(0, 0, 0);
            this.assignedColorIndex = 0;
        }
        __initialize() {
            super.__initialize();
            this.handObjectManager = this.handObjectManager;
            this.handType = this.handType; // "left" or "right"
            this.testingMode = this.testingMode;
            this.handColorMaterials = this.handColorMaterials;
            this.syncEntity = new SyncEntity_1.SyncEntity(this);
            this.cameraTransform = WorldCameraFinderProvider_1.default.getInstance().getTransform();
            this.transform = this.sceneObject.getTransform();
            this.previousPos = new vec3(0, 0, 0);
            this.assignedColorIndex = 0;
        }
        onUpdate() {
            // Only update position for local player's hands
            if (!this.syncEntity || !this.syncEntity.networkRoot.locallyCreated) {
                return;
            }
            let newPos;
            if (this.testingMode) {
                // Testing mode: use camera position with offset
                const cameraPos = this.cameraTransform.getWorldPosition();
                const forward = this.cameraTransform.forward.uniformScale(20); // 20cm forward
                const handsCenter = cameraPos.add(forward);
                // Offset left/right based on hand type
                const lateralOffset = this.handType === "left" ? new vec3(-5, 0, 0) : new vec3(5, 0, 0);
                newPos = handsCenter.add(lateralOffset);
                print(`📝 Testing: ${this.handType} hand at (${newPos.x.toFixed(2)}, ${newPos.y.toFixed(2)}, ${newPos.z.toFixed(2)})`);
            }
            else {
                // Normal mode: use SIK hand tracking
                if (this.trackedHand && this.trackedHand.isTracked()) {
                    newPos = this.trackedHand.getPalmCenter();
                }
                else {
                    // Hand not tracked, keep previous position or hide
                    this.sceneObject.enabled = false;
                    return;
                }
            }
            // Smooth position update
            const updatePos = vec3.lerp(this.previousPos, newPos, getDeltaTime() * 10);
            this.transform.setWorldPosition(updatePos);
            this.previousPos = updatePos;
            this.sceneObject.enabled = true;
        }
        onStart() {
            this.syncEntity.notifyOnReady(() => {
                // Assign color based on owner's connectionId
                this.assignHandColor();
                if (this.syncEntity.networkRoot.locallyCreated) {
                    // This is MY hand representation
                    print(`Setting up local ${this.handType} hand`);
                    // Initialize hand tracking
                    this.trackedHand = SIK_1.SIK.HandInputData.getHand(this.handType);
                    // Set initial position
                    if (this.testingMode) {
                        const cameraPos = this.cameraTransform.getWorldPosition();
                        const forward = this.cameraTransform.forward.uniformScale(20);
                        const handsCenter = cameraPos.add(forward);
                        const lateralOffset = this.handType === "left" ? new vec3(-5, 0, 0) : new vec3(5, 0, 0);
                        this.previousPos = handsCenter.add(lateralOffset);
                    }
                    else if (this.trackedHand && this.trackedHand.isTracked()) {
                        this.previousPos = this.trackedHand.getPalmCenter();
                    }
                    else {
                        this.previousPos = vec3.zero();
                    }
                    this.transform.setWorldPosition(this.previousPos);
                    // Enable the hand object content and subscribe to HandObjectManager
                    this.sceneObject.name = this.sceneObject.name + ` (Local ${this.handType} Hand)`;
                    this.sceneObject.getChild(0).enabled = true;
                    this.handObjectManager.subscribe(this);
                }
                else {
                    // This represents another player's hand
                    print(`Setting up remote ${this.handType} hand`);
                    this.sceneObject.name = this.sceneObject.name + ` (Remote ${this.handType} Hand)`;
                    this.sceneObject.getChild(0).enabled = true;
                }
            });
        }
        getWorldPosition() {
            return this.transform.getWorldPosition();
        }
        getHandType() {
            return this.handType;
        }
        isLocalHand() {
            return this.syncEntity && this.syncEntity.networkRoot && this.syncEntity.networkRoot.locallyCreated;
        }
        isHandTracked() {
            if (this.testingMode) {
                return true; // Always tracked in testing mode
            }
            return this.trackedHand && this.trackedHand.isTracked();
        }
        /**
         * Assign a color to this hand based on the owner's connectionId
         */
        assignHandColor() {
            // Validate we have color materials
            if (!this.handColorMaterials || this.handColorMaterials.length === 0) {
                print("⚠️ HandObjectController: No hand color materials assigned");
                return;
            }
            // Get owner's connectionId
            const ownerInfo = this.syncEntity.networkRoot.ownerInfo;
            if (!ownerInfo) {
                print("⚠️ HandObjectController: No owner info available");
                return;
            }
            // Calculate color index (same as player color for consistency)
            this.assignedColorIndex = PlayerColorAssigner_1.PlayerColorAssigner.getColorIndexForPlayer(ownerInfo.connectionId, this.handColorMaterials.length);
            const colorName = PlayerColorAssigner_1.PlayerColorAssigner.getColorName(this.assignedColorIndex);
            print(`🎨 HandObjectController: Assigned ${colorName} (index ${this.assignedColorIndex}) to ${this.handType} hand of ${ownerInfo.displayName || ownerInfo.connectionId}`);
            // Apply the material to hand visual
            this.applyHandColorMaterial();
        }
        /**
         * Apply the assigned color material to the hand's visual components
         */
        applyHandColorMaterial() {
            if (!this.handColorMaterials || this.assignedColorIndex >= this.handColorMaterials.length) {
                return;
            }
            const selectedMaterial = this.handColorMaterials[this.assignedColorIndex];
            if (!selectedMaterial) {
                print("⚠️ HandObjectController: Selected hand material is null");
                return;
            }
            // Apply material to all MaterialMeshVisual components in children
            this.applyMaterialToChildren(this.sceneObject, selectedMaterial);
        }
        /**
         * Recursively apply material to all MaterialMeshVisual and RenderMeshVisual components
         */
        applyMaterialToChildren(obj, material) {
            // Try MaterialMeshVisual first
            const materialMeshVisual = obj.getComponent("Component.MaterialMeshVisual");
            if (materialMeshVisual) {
                materialMeshVisual.mainMaterial = material;
                print(`🎨 Applied ${PlayerColorAssigner_1.PlayerColorAssigner.getColorName(this.assignedColorIndex)} material to MaterialMeshVisual on ${this.handType} hand ${obj.name}`);
            }
            // Try RenderMeshVisual (for prefabs with RenderMeshVisual)
            const renderMeshVisual = obj.getComponent("Component.RenderMeshVisual");
            if (renderMeshVisual) {
                renderMeshVisual.mainMaterial = material;
                print(`🎨 Applied ${PlayerColorAssigner_1.PlayerColorAssigner.getColorName(this.assignedColorIndex)} material to RenderMeshVisual on ${this.handType} hand ${obj.name}`);
            }
            // Apply to children recursively
            for (let i = 0; i < obj.getChildrenCount(); i++) {
                this.applyMaterialToChildren(obj.getChild(i), material);
            }
        }
        /**
         * Get the assigned color index for this hand
         */
        getAssignedColorIndex() {
            return this.assignedColorIndex;
        }
        /**
         * Get the assigned color name for this hand
         */
        getAssignedColorName() {
            return PlayerColorAssigner_1.PlayerColorAssigner.getColorName(this.assignedColorIndex);
        }
        onAwake() {
            this.createEvent("OnStartEvent").bind(() => this.onStart());
        }
    };
    __setFunctionName(_classThis, "HandObjectController");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        HandObjectController = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return HandObjectController = _classThis;
})();
exports.HandObjectController = HandObjectController;
//# sourceMappingURL=HandObjectController.js.map