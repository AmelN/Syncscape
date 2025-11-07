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
exports.HeadLabelObjectController = exports.AvailabilityState = void 0;
var __selfType = requireType("./HeadLabelObjectController");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const SyncEntity_1 = require("SpectaclesSyncKit.lspkg/Core/SyncEntity");
const StorageProperty_1 = require("SpectaclesSyncKit.lspkg/Core/StorageProperty");
const StoragePropertySet_1 = require("SpectaclesSyncKit.lspkg/Core/StoragePropertySet");
const SessionController_1 = require("SpectaclesSyncKit.lspkg/Core/SessionController");
const WorldCameraFinderProvider_1 = require("SpectaclesInteractionKit.lspkg/Providers/CameraProvider/WorldCameraFinderProvider");
const RectangleButton_1 = require("SpectaclesUIKit.lspkg/Scripts/Components/Button/RectangleButton");
/**
 * Availability states for the user
 */
var AvailabilityState;
(function (AvailabilityState) {
    AvailabilityState[AvailabilityState["Available"] = 0] = "Available";
    AvailabilityState[AvailabilityState["Busy"] = 1] = "Busy";
    AvailabilityState[AvailabilityState["Away"] = 2] = "Away";
    AvailabilityState[AvailabilityState["DoNotDisturb"] = 3] = "DoNotDisturb"; // Grey - Do not disturb
})(AvailabilityState || (exports.AvailabilityState = AvailabilityState = {}));
let HeadLabelObjectController = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var HeadLabelObjectController = _classThis = class extends _classSuper {
        __initialize() {
            super.__initialize();
            this.headLabelManager = this.headLabelManager;
            this.headLabelReferences = this.headLabelReferences;
            this.cloudStorageModule = this.cloudStorageModule;
            this.pingMenu = this.pingMenu;
            this.cameraTransform = WorldCameraFinderProvider_1.default.getInstance().getTransform();
            this.transform = this.sceneObject.getTransform();
            this.previousPos = new vec3(0, 0, 0);
            this.cloudStore = null;
            // Store user info for ping targeting
            this.userInfo = null;
            // Default values
            this.DEFAULT_STATUS = "Hello from Spectacles!";
            this.DEFAULT_SUB_STATUS = "Ready to connect";
            this.DEFAULT_AVAILABILITY = AvailabilityState.Available;
            // PROPER CONNECTED LENSES PATTERN:
            // Initialize storage properties with simple keys (no unique prefixes needed)
            // The framework handles uniqueness through proper network IDs
            this.userNameProp = StorageProperty_1.StorageProperty.manualString("userName", "Unknown User");
            this.statusTextProp = StorageProperty_1.StorageProperty.manualString("statusText", "Hello from Spectacles!");
            this.subStatusTextProp = StorageProperty_1.StorageProperty.manualString("subStatusText", "Ready to connect");
            this.availabilityProp = StorageProperty_1.StorageProperty.manualInt("availability", 0);
            this.pingStateProp = StorageProperty_1.StorageProperty.manualBool("pingState", false);
            // Create storage property set
            this.storagePropertySet = new StoragePropertySet_1.StoragePropertySet([
                this.userNameProp,
                this.statusTextProp,
                this.subStatusTextProp,
                this.availabilityProp,
                this.pingStateProp
            ]);
            // Initialize SyncEntity with proper Connected Lenses pattern:
            // - Use storage properties
            // - Claim ownership (this is a player-owned object)
            // - Use "Owner" persistence (destroyed when player leaves)
            this.syncEntity = new SyncEntity_1.SyncEntity(this, this.storagePropertySet, true, "Owner");
        }
        constructor() {
            super();
            this.headLabelManager = this.headLabelManager;
            this.headLabelReferences = this.headLabelReferences;
            this.cloudStorageModule = this.cloudStorageModule;
            this.pingMenu = this.pingMenu;
            this.cameraTransform = WorldCameraFinderProvider_1.default.getInstance().getTransform();
            this.transform = this.sceneObject.getTransform();
            this.previousPos = new vec3(0, 0, 0);
            this.cloudStore = null;
            // Store user info for ping targeting
            this.userInfo = null;
            // Default values
            this.DEFAULT_STATUS = "Hello from Spectacles!";
            this.DEFAULT_SUB_STATUS = "Ready to connect";
            this.DEFAULT_AVAILABILITY = AvailabilityState.Available;
            // PROPER CONNECTED LENSES PATTERN:
            // Initialize storage properties with simple keys (no unique prefixes needed)
            // The framework handles uniqueness through proper network IDs
            this.userNameProp = StorageProperty_1.StorageProperty.manualString("userName", "Unknown User");
            this.statusTextProp = StorageProperty_1.StorageProperty.manualString("statusText", "Hello from Spectacles!");
            this.subStatusTextProp = StorageProperty_1.StorageProperty.manualString("subStatusText", "Ready to connect");
            this.availabilityProp = StorageProperty_1.StorageProperty.manualInt("availability", 0);
            this.pingStateProp = StorageProperty_1.StorageProperty.manualBool("pingState", false);
            // Create storage property set
            this.storagePropertySet = new StoragePropertySet_1.StoragePropertySet([
                this.userNameProp,
                this.statusTextProp,
                this.subStatusTextProp,
                this.availabilityProp,
                this.pingStateProp
            ]);
            // Initialize SyncEntity with proper Connected Lenses pattern:
            // - Use storage properties
            // - Claim ownership (this is a player-owned object)
            // - Use "Owner" persistence (destroyed when player leaves)
            this.syncEntity = new SyncEntity_1.SyncEntity(this, this.storagePropertySet, true, "Owner");
        }
        onUpdate() {
            // Only update position for local player's head label
            if (!this.syncEntity || !this.syncEntity.networkRoot.locallyCreated) {
                return;
            }
            // Position head label with proper head pose following
            // 20cm forward and 20cm upward from head position
            const headPos = this.cameraTransform.getWorldPosition();
            const headForward = this.cameraTransform.forward;
            const worldUp = new vec3(0, 1, 0); // World up vector
            const targetPos = headPos
                .add(headForward.uniformScale(20)) // 20cm forward
                .add(worldUp.uniformScale(20)); // 20cm upward
            // Smooth position update (same lerp speed as PlayerObjectController)
            const updatePos = vec3.lerp(this.previousPos, targetPos, getDeltaTime() * 5);
            this.transform.setWorldPosition(updatePos);
            this.previousPos = updatePos;
            // Set rotation to follow head Y-axis only (no X/Z tilt, no billboard)
            const headRotation = this.cameraTransform.getWorldRotation();
            // Extract forward vector and project onto XZ plane to get Y-rotation only
            const forward = headRotation.multiplyVec3(vec3.forward());
            const forwardXZ = new vec3(forward.x, 0, forward.z);
            // Only rotate if we have a meaningful direction
            if (forwardXZ.length > 0.001) {
                const normalizedForwardXZ = forwardXZ.normalize();
                const yRotationOnly = quat.lookAt(normalizedForwardXZ, vec3.up());
                this.transform.setWorldRotation(yRotationOnly);
            }
            // Debug positioning (only occasionally to avoid spam)
            if (Math.random() < 0.01) { // 1% chance each frame
                // print(`📍 HeadLabel position: (${updatePos.x.toFixed(1)}, ${updatePos.y.toFixed(1)}, ${updatePos.z.toFixed(1)})`);
                //print(`📍 Camera position: (${this.cameraTransform.getWorldPosition().x.toFixed(1)}, ${this.cameraTransform.getWorldPosition().y.toFixed(1)}, ${this.cameraTransform.getWorldPosition().z.toFixed(1)})`);
            }
        }
        onStart() {
            print("🏷️ HeadLabelObjectController: onStart() called - SceneObject: " + this.sceneObject.name);
            // Initialize storage properties for persistent data
            this.initializeStorageProperties();
            // Wait for SyncEntity to be ready before proceeding
            this.syncEntity.notifyOnReady(() => {
                print("✅ HeadLabelObjectController: SyncEntity ready");
                const userName = this.getUserNameFromSession();
                // Log comprehensive user info for debugging
                this.logUserInfo();
                // Initialize cloud storage for persistent data
                this.initializeCloudStorage();
                if (this.syncEntity.networkRoot.locallyCreated) {
                    // This is MY head label - only one per player due to "Owner" persistence
                    print("📝 HeadLabelController: Setting up local head label for " + userName);
                    // Set initial position (20cm forward, 20cm upward from head)
                    const headPos = this.cameraTransform.getWorldPosition();
                    const headForward = this.cameraTransform.forward;
                    const worldUp = new vec3(0, 1, 0);
                    this.previousPos = headPos
                        .add(headForward.uniformScale(20)) // 20cm forward
                        .add(worldUp.uniformScale(20)); // 20cm upward
                    this.transform.setWorldPosition(this.previousPos);
                    // Initialize with default values if not already set
                    this.initializeDefaultValues(userName);
                    // Enable the head label and subscribe to manager
                    this.sceneObject.name = this.sceneObject.name + " (Local Head Label)";
                    this.sceneObject.enabled = true;
                    this.headLabelManager.subscribe(this);
                }
                else {
                    // This represents another player's head label
                    this.sceneObject.name = this.sceneObject.name + " (Remote Head Label)";
                    this.sceneObject.enabled = true;
                    // Subscribe to manager for remote labels too
                    this.headLabelManager.subscribe(this);
                    // Store user info from SyncEntity owner for ping targeting
                    this.userInfo = this.syncEntity.networkRoot.ownerInfo;
                    // If SyncEntity owner info is not available, try to find user by matching from SessionController
                    if (!this.userInfo || (!this.userInfo.connectionId && !this.userInfo.userId)) {
                        this.findUserInfoFromSession();
                    }
                    // Set up ping interaction for remote head labels
                    this.setupPingInteraction();
                    // Get the remote user's display name directly from owner info
                    const remoteName = this.getUserNameFromSession();
                    // Set initial UI values directly for remote labels
                    // The storage property callbacks will handle updates once values sync
                    if (this.headLabelReferences) {
                        if (this.headLabelReferences.textUserName) {
                            this.headLabelReferences.textUserName.text = remoteName;
                            print(`✅ HeadLabelController: Set remote username text to: "${remoteName}"`);
                        }
                        if (this.headLabelReferences.textStatus) {
                            this.headLabelReferences.textStatus.text = this.DEFAULT_STATUS;
                        }
                        if (this.headLabelReferences.textSubStatus) {
                            this.headLabelReferences.textSubStatus.text = this.DEFAULT_SUB_STATUS;
                        }
                    }
                    // DO NOT call updateUIFromProperties() - storage properties aren't synced yet
                    // The callbacks will update the UI once the values are actually synced
                }
            });
        }
        initializeStorageProperties() {
            // Add storage properties to sync entity
            this.syncEntity.addStorageProperty(this.userNameProp);
            this.syncEntity.addStorageProperty(this.statusTextProp);
            this.syncEntity.addStorageProperty(this.subStatusTextProp);
            this.syncEntity.addStorageProperty(this.availabilityProp);
            this.syncEntity.addStorageProperty(this.pingStateProp);
            // Subscribe to changes for remote updates
            this.userNameProp.onAnyChange.add((newVal, oldVal) => this.onUserNameChanged());
            this.statusTextProp.onAnyChange.add((newVal, oldVal) => this.onStatusTextChanged());
            this.subStatusTextProp.onAnyChange.add((newVal, oldVal) => this.onSubStatusTextChanged());
            this.availabilityProp.onAnyChange.add((newVal, oldVal) => this.onAvailabilityChanged());
            this.pingStateProp.onAnyChange.add((newVal, oldVal) => this.onPingStateChanged());
        }
        initializeDefaultValues(userName) {
            try {
                print(`📝 HeadLabelController: Initializing default values for ${userName}`);
                // Set initial values for local user
                // Use setValueImmediate for the username since we own the entity and want immediate UI update
                if (this.syncEntity.canIModifyStore()) {
                    this.userNameProp.setValueImmediate(this.syncEntity.currentStore, userName);
                    print(`📝 HeadLabelController: Set username immediately to: ${userName}`);
                }
                else {
                    this.userNameProp.setPendingValue(userName);
                    print(`📝 HeadLabelController: Set username as pending: ${userName}`);
                }
                this.statusTextProp.setPendingValue(this.DEFAULT_STATUS);
                this.subStatusTextProp.setPendingValue(this.DEFAULT_SUB_STATUS);
                this.availabilityProp.setPendingValue(this.DEFAULT_AVAILABILITY);
                this.pingStateProp.setPendingValue(false);
                print(`📝 HeadLabelController: Default values set, updating UI...`);
                // CRITICAL FIX: Set UI text DIRECTLY with the correct userName
                // DO NOT use updateUIFromProperties() here because storage properties aren't synced yet
                // The storage property callbacks will handle subsequent updates
                if (this.headLabelReferences) {
                    if (this.headLabelReferences.textUserName) {
                        this.headLabelReferences.textUserName.text = userName;
                        print(`✅ HeadLabelController: Set username text to: "${userName}"`);
                    }
                    if (this.headLabelReferences.textStatus) {
                        this.headLabelReferences.textStatus.text = this.DEFAULT_STATUS;
                        print(`✅ HeadLabelController: Set status text to: "${this.DEFAULT_STATUS}"`);
                    }
                    if (this.headLabelReferences.textSubStatus) {
                        this.headLabelReferences.textSubStatus.text = this.DEFAULT_SUB_STATUS;
                        print(`✅ HeadLabelController: Set substatus text to: "${this.DEFAULT_SUB_STATUS}"`);
                    }
                }
                // DO NOT call updateUIFromProperties() here - it will use storage property values
                // which aren't synced yet and will show "Unknown User"
                // The storage property callbacks (onUserNameChanged, etc.) will update the UI
                // once the values are actually synced
                // The currentOrPendingValue approach should handle the timing issue
                // No need for delayed update since we're using the proper Spectacles Sync Kit pattern
                print(`📝 HeadLabelController: Initialization complete`);
            }
            catch (error) {
                print(`❌ HeadLabelController: Error in initializeDefaultValues - ${error}`);
            }
        }
        getUserNameFromSession() {
            // PROPER CONNECTED LENSES PATTERN:
            // Priority 1: Check NetworkRootInfo.dataStore for displayName (passed during instantiation)
            if (this.syncEntity.networkRoot && this.syncEntity.networkRoot.dataStore) {
                const dataStore = this.syncEntity.networkRoot.dataStore;
                const displayNameFromStore = dataStore.getString("displayName");
                if (displayNameFromStore) {
                    print(`📦 HeadLabelController: Found displayName in NetworkRootInfo.dataStore: "${displayNameFromStore}"`);
                    return displayNameFromStore;
                }
            }
            // For local users, use Session Controller
            if (this.isLocalLabel()) {
                try {
                    // Try to get display name from getLocalUserInfo()
                    const localUserInfo = SessionController_1.SessionController.getInstance().getLocalUserInfo();
                    print(`🔍 HeadLabelController: Local user info check:`);
                    print(`  LocalUserInfo exists: ${localUserInfo ? 'YES' : 'NO'}`);
                    if (localUserInfo && localUserInfo.displayName) {
                        print(`  DisplayName found: ${localUserInfo.displayName}`);
                        return localUserInfo.displayName;
                    }
                    // If no displayName, try userId from getLocalUserInfo()
                    if (localUserInfo && localUserInfo.userId) {
                        print(`  UserId found: ${localUserInfo.userId}`);
                        return localUserInfo.userId;
                    }
                    // Fallback to getLocalUserName() which we know works
                    print(`⚠️ HeadLabelController: No displayName/userId from getLocalUserInfo(), trying getLocalUserName()`);
                    const userName = SessionController_1.SessionController.getInstance().getLocalUserName();
                    print(`  getLocalUserName() result: ${userName || 'N/A'}`);
                    return userName || "Unknown User";
                }
                catch (error) {
                    print(`❌ Error getting local user info: ${error}`);
                    // Fallback to getLocalUserName() on error
                    try {
                        const userName = SessionController_1.SessionController.getInstance().getLocalUserName();
                        print(`  Fallback getLocalUserName() result: ${userName || 'N/A'}`);
                        return userName || "Unknown User";
                    }
                    catch (fallbackError) {
                        print(`❌ Fallback also failed: ${fallbackError}`);
                        return "Unknown User";
                    }
                }
            }
            else {
                // For remote users, use comprehensive owner info
                const ownerInfo = this.syncEntity.networkRoot.ownerInfo;
                if (!ownerInfo) {
                    return "Unknown User";
                }
                // Priority: displayName > userId > connectionId
                // displayName is consistent across devices and sessions
                return ownerInfo.displayName ||
                    ownerInfo.userId ||
                    ownerInfo.connectionId ||
                    "Unknown User";
            }
        }
        updateUIFromProperties() {
            if (!this.headLabelReferences) {
                print("⚠️ HeadLabelController: No head label references assigned - skipping UI update");
                return;
            }
            try {
                // Update text components with safety checks and string conversion
                if (this.headLabelReferences.textUserName && this.userNameProp) {
                    // Use currentOrPendingValue for better reliability during initialization
                    // This is especially important for the first user to join the session
                    const userName = String(this.userNameProp.currentOrPendingValue || "Unknown User");
                    this.headLabelReferences.textUserName.text = SessionController_1.SessionController.getInstance().getLocalUserInfo().displayName;
                    print(`📝 Updated username: ${userName}`);
                    print(`📝 Storage property currentValue: ${this.userNameProp.currentValue}`);
                    print(`📝 Storage property pendingValue: ${this.userNameProp.pendingValue}`);
                    print(`📝 Storage property currentOrPendingValue: ${this.userNameProp.currentOrPendingValue}`);
                }
                if (this.headLabelReferences.textStatus && this.statusTextProp) {
                    const status = String(this.statusTextProp.currentOrPendingValue || this.DEFAULT_STATUS);
                    this.headLabelReferences.textStatus.text = status;
                    print(`📝 Updated status: ${status}`);
                }
                if (this.headLabelReferences.textSubStatus && this.subStatusTextProp) {
                    const subStatus = String(this.subStatusTextProp.currentOrPendingValue || this.DEFAULT_SUB_STATUS);
                    this.headLabelReferences.textSubStatus.text = subStatus;
                    print(`📝 Updated substatus: ${subStatus}`);
                }
                // Update material based on availability state
                if (this.availabilityProp) {
                    const availability = Number(this.availabilityProp.currentOrPendingValue) || this.DEFAULT_AVAILABILITY;
                    this.updateAvailabilityVisual(availability);
                }
            }
            catch (error) {
                print(`❌ HeadLabelController: Error updating UI - ${error}`);
            }
        }
        updateAvailabilityVisual(state) {
            // TODO: Implement availability visual feedback if needed
            // This was previously using a materials array that has been removed
            // in favor of the simplified ping material system.
            // If availability visual feedback is needed, consider adding separate
            // availability materials to HeadLabelReferences or using text/color changes.
            print(`📝 HeadLabelController: Availability visual update for state ${state} (not implemented)`);
        }
        // Callback handlers for property changes
        onUserNameChanged() {
            if (this.headLabelReferences && this.headLabelReferences.textUserName) {
                const newName = this.userNameProp.currentOrPendingValue;
                print(`📝 HeadLabel: User name changed to "${newName}"`);
                print(`🔍 Text component exists: ${this.headLabelReferences.textUserName ? 'YES' : 'NO'}`);
                print(`🔍 Text component before: "${this.headLabelReferences.textUserName.text}"`);
                this.headLabelReferences.textUserName.text = newName;
                print(`🔍 Text component after: "${this.headLabelReferences.textUserName.text}"`);
                print(`🔍 Verification - does it match? ${this.headLabelReferences.textUserName.text === newName ? 'YES' : 'NO'}`);
            }
            else {
                print(`❌ HeadLabel: Cannot update username - references not available`);
                print(`🔍 headLabelReferences: ${this.headLabelReferences ? 'EXISTS' : 'NULL'}`);
                print(`🔍 textUserName: ${this.headLabelReferences?.textUserName ? 'EXISTS' : 'NULL'}`);
            }
        }
        onStatusTextChanged() {
            if (this.headLabelReferences && this.headLabelReferences.textStatus) {
                this.headLabelReferences.textStatus.text = this.statusTextProp.currentOrPendingValue;
                print(`📝 HeadLabel: Status changed to "${this.statusTextProp.currentOrPendingValue}"`);
            }
        }
        onSubStatusTextChanged() {
            if (this.headLabelReferences && this.headLabelReferences.textSubStatus) {
                this.headLabelReferences.textSubStatus.text = this.subStatusTextProp.currentOrPendingValue;
                print(`📝 HeadLabel: Sub-status changed to "${this.subStatusTextProp.currentOrPendingValue}"`);
            }
        }
        onAvailabilityChanged() {
            const state = this.availabilityProp.currentOrPendingValue;
            this.updateAvailabilityVisual(state);
            print(`📝 HeadLabel: Availability changed to ${this.getAvailabilityString(state)}`);
        }
        onPingStateChanged() {
            const isPinged = this.pingStateProp.currentOrPendingValue;
            // Update visual indicator for ping state
            // TODO: Add visual feedback for ping state
            print(`📝 HeadLabel: Ping state changed to ${isPinged ? "PINGED" : "NOT PINGED"}`);
        }
        getAvailabilityString(state) {
            switch (state) {
                case AvailabilityState.Available: return "Available";
                case AvailabilityState.Busy: return "Busy";
                case AvailabilityState.Away: return "Away";
                case AvailabilityState.DoNotDisturb: return "Do Not Disturb";
                default: return "Unknown";
            }
        }
        // Public methods for updating head label
        updateStatus(statusText, subStatus) {
            if (!this.isLocalLabel()) {
                print("⚠️ HeadLabelController: Cannot update remote head label");
                return;
            }
            print(`📝 HeadLabelController: Setting status to "${statusText}" and subStatus to "${subStatus}"`);
            this.statusTextProp.setPendingValue(statusText);
            this.subStatusTextProp.setPendingValue(subStatus);
            // Save to cloud storage for persistence
            this.savePersistentData("statusText", statusText);
            this.savePersistentData("subStatusText", subStatus);
            // Force immediate UI update for local display
            this.updateUIFromProperties();
        }
        updateAvailability(state) {
            if (!this.isLocalLabel()) {
                print("⚠️ HeadLabelController: Cannot update remote head label");
                return;
            }
            print(`📝 HeadLabelController: Setting availability to ${this.getAvailabilityString(state)}`);
            this.availabilityProp.setPendingValue(state);
            // Save to cloud storage for persistence
            this.savePersistentData("availability", state);
            // Force immediate UI update for local display
            this.updateUIFromProperties();
        }
        updatePingState(isPinged) {
            if (!this.isLocalLabel()) {
                print("⚠️ HeadLabelController: Cannot update remote head label");
                return;
            }
            print(`📝 HeadLabelController: Setting ping state to ${isPinged ? "PINGED" : "NOT PINGED"}`);
            this.pingStateProp.setPendingValue(isPinged);
            // Update ping visual immediately
            this.updatePingVisual(isPinged);
            // Force immediate UI update for local display
            this.updateUIFromProperties();
        }
        /**
         * Update ping visual state (called by PingMenu)
         */
        updatePingVisual(isConnected) {
            print(`🔍 HeadLabelController: updatePingVisual called with isConnected: ${isConnected}`);
            if (!this.headLabelReferences) {
                print("⚠️ HeadLabelController: No head label references available");
                return;
            }
            // Get the reference materials to copy colors from
            const targetMaterial = isConnected ?
                this.headLabelReferences.pingAcceptedMaterial :
                this.headLabelReferences.pingDefaultMaterial;
            print(`🔍 HeadLabelController: Using ${isConnected ? 'ACCEPTED' : 'DEFAULT'} material for isConnected: ${isConnected}`);
            if (!targetMaterial) {
                print("⚠️ HeadLabelController: Ping materials not assigned in references");
                return;
            }
            // Get the base color from the target material
            const targetColor = targetMaterial.mainPass.baseColor;
            print(`🔍 HeadLabelController: Target color: R=${targetColor.r.toFixed(2)}, G=${targetColor.g.toFixed(2)}, B=${targetColor.b.toFixed(2)}`);
            // Apply to all ping material targets
            if (this.headLabelReferences.pingMaterialTargets && this.headLabelReferences.pingMaterialTargets.length > 0) {
                let targetsUpdated = 0;
                this.headLabelReferences.pingMaterialTargets.forEach((target, index) => {
                    if (target) {
                        const renderMeshVisual = target.getComponent("Component.RenderMeshVisual");
                        if (renderMeshVisual) {
                            // Replace the entire material instead of modifying color properties
                            const oldMaterial = renderMeshVisual.mainMaterial;
                            print(`🔍 HeadLabelController: Target ${index} - Swapping material from ${oldMaterial ? 'ASSIGNED' : 'NONE'} to ${isConnected ? 'ACCEPTED' : 'DEFAULT'}`);
                            // Set the new material
                            renderMeshVisual.mainMaterial = targetMaterial;
                            print(`🎨 HeadLabelController: Target ${index} - Material swapped to ${isConnected ? 'accepted' : 'default'}`);
                            targetsUpdated++;
                        }
                        else {
                            print(`⚠️ HeadLabelController: Ping material target ${index} has no RenderMeshVisual or mainMaterial`);
                        }
                    }
                    else {
                        print(`⚠️ HeadLabelController: Ping material target ${index} is null`);
                    }
                });
                print(`🎨 HeadLabelController: Updated ${targetsUpdated}/${this.headLabelReferences.pingMaterialTargets.length} targets with ${isConnected ? 'accepted' : 'default'} color`);
            }
            else {
                print("⚠️ HeadLabelController: No ping material targets assigned in references");
            }
            print(`🎨 HeadLabelController: Updated ping visual state - connected: ${isConnected}`);
        }
        // Getters for current values
        getStatusText() {
            return this.statusTextProp ? this.statusTextProp.currentOrPendingValue : this.DEFAULT_STATUS;
        }
        getSubStatusText() {
            return this.subStatusTextProp ? this.subStatusTextProp.currentOrPendingValue : this.DEFAULT_SUB_STATUS;
        }
        getAvailability() {
            return this.availabilityProp ? this.availabilityProp.currentOrPendingValue : this.DEFAULT_AVAILABILITY;
        }
        isPinged() {
            return this.pingStateProp ? this.pingStateProp.currentOrPendingValue : false;
        }
        isLocalLabel() {
            return this.syncEntity && this.syncEntity.networkRoot.locallyCreated;
        }
        /**
         * Log comprehensive user information for debugging and understanding
         */
        logUserInfo() {
            const isLocal = this.isLocalLabel();
            const prefix = isLocal ? "👤 LOCAL" : "👥 REMOTE";
            if (isLocal) {
                // For local user, get info from SessionController
                try {
                    const sessionController = SessionController_1.SessionController.getInstance();
                    const localUserInfo = sessionController.getLocalUserInfo();
                    if (localUserInfo) {
                        print(`${prefix} User Info:`);
                        print(`  📧 DisplayName: ${localUserInfo.displayName || "N/A"}`);
                        print(`  🆔 UserId: ${localUserInfo.userId || "N/A"}`);
                        print(`  🔗 ConnectionId: ${localUserInfo.connectionId || "N/A"}`);
                    }
                    else {
                        print(`${prefix} User Info: SessionController user info not available`);
                    }
                }
                catch (error) {
                    print(`${prefix} User Info: Error accessing SessionController - ${error}`);
                }
            }
            else {
                // For remote users, get info from SyncEntity owner
                const ownerInfo = this.syncEntity.networkRoot.ownerInfo;
                if (ownerInfo) {
                    print(`${prefix} User Info:`);
                    print(`  📧 DisplayName: ${ownerInfo.displayName || "N/A"}`);
                    print(`  🆔 UserId: ${ownerInfo.userId || "N/A"}`);
                    print(`  🔗 ConnectionId: ${ownerInfo.connectionId || "N/A"}`);
                }
                else {
                    print(`${prefix} User Info: Owner info not available`);
                }
            }
        }
        /**
         * Try to find user info from SessionController for remote head labels
         */
        findUserInfoFromSession() {
            // For remote labels, try to match by process of elimination
            const allUsers = SessionController_1.SessionController.getInstance().getUsers();
            const localUserInfo = SessionController_1.SessionController.getInstance().getLocalUserInfo();
            // Filter out local user to find remote users
            const remoteUsers = allUsers.filter(user => {
                const userConnectionId = user.connectionId || user.userId;
                const localConnectionId = localUserInfo?.connectionId || localUserInfo?.userId;
                return userConnectionId !== localConnectionId;
            });
            // For now, assign first remote user (in a more complex system, we'd need better matching)
            if (remoteUsers.length > 0) {
                this.userInfo = remoteUsers[0];
                print(`🔍 HeadLabelController: Assigned user info from session - ${this.userInfo.displayName || this.userInfo.connectionId}`);
            }
        }
        /**
         * Get the stored user info for this head label
         */
        getUserInfo() {
            return this.userInfo;
        }
        /**
         * Initialize cloud storage for persistent data
         */
        initializeCloudStorage() {
            if (!this.cloudStorageModule) {
                print("⚠️ HeadLabelController: No CloudStorageModule assigned");
                return;
            }
            if (this.cloudStore) {
                print("ℹ️ HeadLabelController: Cloud storage already initialized");
                return;
            }
            const cloudStorageOptions = CloudStorageOptions.create();
            this.cloudStorageModule.getCloudStore(cloudStorageOptions, (store) => this.onCloudStoreReady(store), (code, message) => print(`❌ HeadLabelController: Cloud storage error: ${code} - ${message}`));
        }
        /**
         * Called when cloud storage is ready
         */
        onCloudStoreReady(store) {
            this.cloudStore = store;
            print("✅ HeadLabelController: Cloud storage ready");
            // Load persistent data for local labels
            if (this.isLocalLabel()) {
                this.loadPersistentData();
            }
        }
        /**
         * Load persistent data from cloud storage
         */
        loadPersistentData() {
            if (!this.cloudStore) {
                print("⚠️ HeadLabelController: Cloud store not ready for loading");
                return;
            }
            const readOptions = CloudStorageReadOptions.create();
            readOptions.scope = StorageScope.User;
            // Get connection-specific key prefix to avoid conflicts
            const userInfo = SessionController_1.SessionController.getInstance().getLocalUserInfo();
            const keyPrefix = userInfo?.connectionId || userInfo?.userId || "default";
            // Load status text
            this.cloudStore.getValue(`${keyPrefix}_statusText`, readOptions, (key, value) => {
                if (value) {
                    this.statusTextProp.setPendingValue(value);
                    print(`📁 HeadLabelController: Loaded status: ${value}`);
                }
            }, (code, message) => print(`ℹ️ HeadLabelController: No saved status found`));
            // Load sub-status text
            this.cloudStore.getValue(`${keyPrefix}_subStatusText`, readOptions, (key, value) => {
                if (value) {
                    this.subStatusTextProp.setPendingValue(value);
                    print(`📁 HeadLabelController: Loaded subStatus: ${value}`);
                }
            }, (code, message) => print(`ℹ️ HeadLabelController: No saved subStatus found`));
            // Load availability
            this.cloudStore.getValue(`${keyPrefix}_availability`, readOptions, (key, value) => {
                if (value !== null && value !== undefined) {
                    this.availabilityProp.setPendingValue(value);
                    print(`📁 HeadLabelController: Loaded availability: ${value}`);
                }
            }, (code, message) => print(`ℹ️ HeadLabelController: No saved availability found`));
        }
        /**
         * Save data to cloud storage
         */
        savePersistentData(key, value) {
            if (!this.cloudStore || !this.isLocalLabel()) {
                return;
            }
            // Get connection-specific key prefix to avoid conflicts
            const userInfo = SessionController_1.SessionController.getInstance().getLocalUserInfo();
            const keyPrefix = userInfo?.connectionId || userInfo?.userId || "default";
            const writeOptions = CloudStorageWriteOptions.create();
            writeOptions.scope = StorageScope.User;
            this.cloudStore.setValue(`${keyPrefix}_${key}`, value, writeOptions, () => print(`💾 HeadLabelController: Saved ${key}: ${value}`), (code, message) => print(`❌ HeadLabelController: Save error: ${code} - ${message}`));
        }
        /**
         * Set up ping interaction for remote head labels using ContainerFrame trigger events
         */
        setupPingInteraction() {
            if (!this.pingMenu) {
                print("⚠️ HeadLabelController: No ping menu assigned for interaction setup");
                return;
            }
            // Find the RectangleButton component on this scene object
            const button = this.sceneObject.getComponent(RectangleButton_1.RectangleButton.getTypeName());
            if (!button) {
                print("⚠️ HeadLabelController: No RectangleButton component found for ping interaction");
                return;
            }
            // Subscribe to button trigger up event (when button is released/clicked)
            button.onTriggerUp.add(() => {
                this.onPingButtonTriggered();
            });
            print("✅ HeadLabelController: Ping interaction set up for remote head label");
        }
        /**
         * Handle ping button trigger event from BaseButton interaction
         * This is called when another player clicks/triggers this head label button
         */
        onPingButtonTriggered() {
            if (!this.pingMenu) {
                print("❌ HeadLabelController: No ping menu available");
                return;
            }
            // For button interactions, we don't have detailed interactor info
            // Use a generic identifier for the ping source
            const interactorName = "Remote Player";
            print(`🎯 HeadLabelController: Ping button triggered by ${interactorName}`);
            // Send ping through the ping menu system
            this.pingMenu.sendPingFromInteraction(this, interactorName);
        }
        onAwake() {
            this.createEvent("OnStartEvent").bind(() => this.onStart());
            this.createEvent("UpdateEvent").bind(() => this.onUpdate());
        }
        onDestroy() {
            // Clean up any resources if needed
            // The framework handles SyncEntity cleanup automatically
            print("🗑️ HeadLabelObjectController: Destroyed");
        }
    };
    __setFunctionName(_classThis, "HeadLabelObjectController");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        HeadLabelObjectController = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return HeadLabelObjectController = _classThis;
})();
exports.HeadLabelObjectController = HeadLabelObjectController;
//# sourceMappingURL=HeadLabelObjectController.js.map