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
exports.PlayerObjectController = void 0;
var __selfType = requireType("./PlayerObjectController");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const SyncEntity_1 = require("SpectaclesSyncKit.lspkg/Core/SyncEntity");
const WorldCameraFinderProvider_1 = require("SpectaclesInteractionKit.lspkg/Providers/CameraProvider/WorldCameraFinderProvider");
const PlayerColorAssigner_1 = require("../Utils/PlayerColorAssigner");
let PlayerObjectController = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var PlayerObjectController = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.playerObjectManager = this.playerObjectManager;
            this.playerColorMaterials = this.playerColorMaterials;
            this.syncEntity = new SyncEntity_1.SyncEntity(this);
            this.cameraTransform = WorldCameraFinderProvider_1.default.getInstance().getTransform();
            this.transform = this.sceneObject.getTransform();
            this.previousPos = new vec3(0, 0, 0);
            this.up = new vec3(0, 1, 0);
            this.assignedColorIndex = 0;
        }
        __initialize() {
            super.__initialize();
            this.playerObjectManager = this.playerObjectManager;
            this.playerColorMaterials = this.playerColorMaterials;
            this.syncEntity = new SyncEntity_1.SyncEntity(this);
            this.cameraTransform = WorldCameraFinderProvider_1.default.getInstance().getTransform();
            this.transform = this.sceneObject.getTransform();
            this.previousPos = new vec3(0, 0, 0);
            this.up = new vec3(0, 1, 0);
            this.assignedColorIndex = 0;
        }
        onUpdate() {
            // tether object 
            // Update the player object pose for the local player here, gets synced via SyncTransform
            const forward = this.cameraTransform.forward.mult(new vec3(1, 0, 1));
            const newPos = this.cameraTransform
                .getWorldPosition()
                .add(forward.uniformScale(-50));
            const updatePos = vec3.lerp(this.previousPos, newPos, getDeltaTime() * 5);
            this.transform.setWorldPosition(updatePos);
            this.previousPos = updatePos;
        }
        onStart() {
            this.sceneObject.getChild(0).enabled = true;
            //this.syncEntity.addStorageProperty(this.somethingHappenedProp);
            this.syncEntity.notifyOnReady(() => {
                // Assign color based on owner's connectionId
                this.assignPlayerColor();
                if (this.syncEntity.networkRoot.locallyCreated) {
                    // Set start position
                    const forward = this.cameraTransform.forward.mult(new vec3(1, 0, 1));
                    this.previousPos = this.cameraTransform
                        .getWorldPosition()
                        .add(forward.uniformScale(-50));
                    this.transform.setWorldPosition(this.previousPos);
                    // Enable the player object content and subscribe to PlayerObjectManager
                    this.sceneObject.name = this.sceneObject.name + " (Local Player)";
                    this.sceneObject.getChild(0).enabled = true;
                    this.playerObjectManager.subscribe(this);
                }
                else {
                    this.sceneObject.name = this.sceneObject.name + " (Remote Player)";
                }
            });
        }
        /**
         * Assign a color to this player based on their connectionId
         */
        assignPlayerColor() {
            // Validate we have color materials
            if (!this.playerColorMaterials || this.playerColorMaterials.length === 0) {
                print("⚠️ PlayerObjectController: No color materials assigned");
                return;
            }
            // Validate color count is reasonable
            PlayerColorAssigner_1.PlayerColorAssigner.validateColorCount(this.playerColorMaterials.length);
            // Get owner's connectionId
            const ownerInfo = this.syncEntity.networkRoot.ownerInfo;
            if (!ownerInfo) {
                print("⚠️ PlayerObjectController: No owner info available");
                return;
            }
            // Calculate color index
            this.assignedColorIndex = PlayerColorAssigner_1.PlayerColorAssigner.getColorIndexForPlayer(ownerInfo.connectionId, this.playerColorMaterials.length);
            const colorName = PlayerColorAssigner_1.PlayerColorAssigner.getColorName(this.assignedColorIndex);
            print(`🎨 PlayerObjectController: Assigned ${colorName} (index ${this.assignedColorIndex}) to player ${ownerInfo.displayName || ownerInfo.connectionId}`);
            // Apply the material to player visual
            this.applyColorMaterial();
        }
        /**
         * Apply the assigned color material to the player's visual components
         */
        applyColorMaterial() {
            if (!this.playerColorMaterials || this.playerColorMaterials.length === 0) {
                print("⚠️ PlayerObjectController: No color materials assigned");
                return;
            }
            if (this.assignedColorIndex >= this.playerColorMaterials.length) {
                print(`⚠️ PlayerObjectController: Color index ${this.assignedColorIndex} out of range (max: ${this.playerColorMaterials.length - 1})`);
                return;
            }
            const selectedMaterial = this.playerColorMaterials[this.assignedColorIndex];
            if (!selectedMaterial) {
                print("⚠️ PlayerObjectController: Selected material is null");
                return;
            }
            print(`🎨 PlayerObjectController: Applying ${PlayerColorAssigner_1.PlayerColorAssigner.getColorName(this.assignedColorIndex)} material to player object`);
            // Apply material to all MaterialMeshVisual and RenderMeshVisual components in children
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
                print(`🎨 Applied ${PlayerColorAssigner_1.PlayerColorAssigner.getColorName(this.assignedColorIndex)} material to MaterialMeshVisual on ${obj.name}`);
            }
            // Try RenderMeshVisual (for prefabs with RenderMeshVisual)
            const renderMeshVisual = obj.getComponent("Component.RenderMeshVisual");
            if (renderMeshVisual) {
                renderMeshVisual.mainMaterial = material;
                print(`🎨 Applied ${PlayerColorAssigner_1.PlayerColorAssigner.getColorName(this.assignedColorIndex)} material to RenderMeshVisual on ${obj.name}`);
            }
            // Apply to children recursively
            for (let i = 0; i < obj.getChildrenCount(); i++) {
                this.applyMaterialToChildren(obj.getChild(i), material);
            }
        }
        /**
         * Get the assigned color index for this player
         */
        getAssignedColorIndex() {
            return this.assignedColorIndex;
        }
        /**
         * Get the assigned color name for this player
         */
        getAssignedColorName() {
            return PlayerColorAssigner_1.PlayerColorAssigner.getColorName(this.assignedColorIndex);
        }
        onAwake() {
            this.createEvent("OnStartEvent").bind(() => this.onStart());
        }
    };
    __setFunctionName(_classThis, "PlayerObjectController");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        PlayerObjectController = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return PlayerObjectController = _classThis;
})();
exports.PlayerObjectController = PlayerObjectController;
//# sourceMappingURL=PlayerObjectController.js.map