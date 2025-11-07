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
exports.HeadLabelObjectManager = void 0;
var __selfType = requireType("./HeadLabelObjectManager");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const SessionController_1 = require("SpectaclesSyncKit.lspkg/Core/SessionController");
let HeadLabelObjectManager = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var HeadLabelObjectManager = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.instantiator = this.instantiator;
            this.headLabelPrefab = this.headLabelPrefab;
            this.allHeadLabels = [];
            this.hasInstantiated = false; // Guard to prevent multiple instantiations
            // Callbacks for external systems (like HandMenu)
            this.onHeadLabelReadyCallbacks = [];
        }
        __initialize() {
            super.__initialize();
            this.instantiator = this.instantiator;
            this.headLabelPrefab = this.headLabelPrefab;
            this.allHeadLabels = [];
            this.hasInstantiated = false; // Guard to prevent multiple instantiations
            // Callbacks for external systems (like HandMenu)
            this.onHeadLabelReadyCallbacks = [];
        }
        onAwake() {
            this.createEvent("OnStartEvent").bind(() => this.onStart());
        }
        onStart() {
            HeadLabelObjectManager.managerCount++;
            print("📝 HeadLabelManager: onStart() called - Instance ID: " + this.sceneObject.name + " - UniqueId: " + this.sceneObject.uniqueIdentifier);
            print("📊 HeadLabelManager: This is manager instance #" + HeadLabelObjectManager.managerCount);
            print("🔍 HeadLabelManager: Scene object path: " + this.getSceneObjectPath());
            // Check for duplicate managers
            if (HeadLabelObjectManager.managerCount > 1) {
                print("🚨 HeadLabelManager: WARNING - Multiple HeadLabelObjectManager instances detected!");
                print("🚨 HeadLabelManager: This will cause duplicate head label instantiation!");
                print("🚨 HeadLabelManager: Check your scene hierarchy for duplicate manager objects!");
            }
            SessionController_1.SessionController.getInstance().notifyOnReady(() => {
                print("📝 HeadLabelManager: SessionController ready - Instance ID: " + this.sceneObject.name + " - UniqueId: " + this.sceneObject.uniqueIdentifier);
                this.instantiator.notifyOnReady(() => {
                    print("📝 HeadLabelManager: Instantiator ready, calling instantiateHeadLabel - Instance ID: " + this.sceneObject.name + " - UniqueId: " + this.sceneObject.uniqueIdentifier);
                    print("🔍 HeadLabelManager: Instantiator object name: " + this.instantiator.sceneObject.name);
                    print("🔍 HeadLabelManager: Head label prefab assigned: " + (this.headLabelPrefab ? this.headLabelPrefab.name : "NULL"));
                    this.instantiateHeadLabel();
                });
            });
        }
        onUpdate() {
            // Update all head labels
            this.allHeadLabels.forEach(headLabel => {
                if (headLabel && headLabel.isLocalLabel()) {
                    headLabel.onUpdate();
                }
            });
        }
        subscribe(headLabel) {
            this.allHeadLabels.push(headLabel);
            if (headLabel.isLocalLabel()) {
                this.myHeadLabel = headLabel;
                print("📝 HeadLabelManager: Subscribed to local head label");
                // Notify callbacks that local head label is ready
                this.notifyHeadLabelReady(headLabel);
            }
            else {
                print("📝 HeadLabelManager: Subscribed to remote head label");
            }
            // Start updating if this is the first subscription
            if (this.allHeadLabels.length === 1) {
                this.createEvent("UpdateEvent").bind(() => this.onUpdate());
            }
        }
        /**
         * Instantiate the head label for the local user.
         * This is called when the session is ready and the instantiator is ready.
         */
        instantiateHeadLabel() {
            // Guard against multiple instantiations
            if (this.hasInstantiated) {
                print("⚠️ HeadLabelManager: Head label already instantiated, skipping - Instance ID: " + this.sceneObject.name);
                return;
            }
            const localUserInfo = SessionController_1.SessionController.getInstance().getLocalUserInfo();
            print(`🔍 HeadLabelManager: Local user info check:`);
            print(`  LocalUserInfo exists: ${localUserInfo ? 'YES' : 'NO'}`);
            let displayName = "Unknown User";
            let userId = "Unknown";
            if (localUserInfo) {
                print(`  DisplayName: ${localUserInfo.displayName || 'N/A'}`);
                print(`  UserId: ${localUserInfo.userId || 'N/A'}`);
                print(`  ConnectionId: ${localUserInfo.connectionId || 'N/A'}`);
                // Try to get display name first
                if (localUserInfo.displayName) {
                    displayName = localUserInfo.displayName;
                    userId = localUserInfo.userId || "Unknown";
                }
                else if (localUserInfo.userId) {
                    displayName = localUserInfo.userId;
                    userId = localUserInfo.userId;
                }
            }
            // Fallback to getLocalUserName() if we don't have a good name
            if (displayName === "Unknown User") {
                print(`⚠️ HeadLabelManager: No good name from getLocalUserInfo(), trying getLocalUserName()`);
                const userName = SessionController_1.SessionController.getInstance().getLocalUserName();
                print(`  getLocalUserName() result: ${userName || 'N/A'}`);
                if (userName) {
                    displayName = userName;
                    userId = userName; // Use same value for both
                }
            }
            print("HeadLabelManager: Instantiating head label for " + displayName + " (userId: " + userId + ")");
            // PROPER CONNECTED LENSES PATTERN:
            // Use customDataStore to pass initial data to the prefab
            // This ensures the display name is available immediately when the prefab is instantiated
            const customDataStore = GeneralDataStore.create();
            customDataStore.putString("displayName", displayName);
            customDataStore.putString("userId", userId);
            print(`📦 HeadLabelManager: Created customDataStore with displayName="${displayName}"`);
            // Use userId-based network ID to ensure only one head label per player
            // Use "Owner" persistence so it's destroyed when player leaves
            this.hasInstantiated = true;
            this.instantiator.instantiate(this.headLabelPrefab, {
                // Use userId as network ID to prevent duplicates across sessions
                //overrideNetworkId: userId + "_headLabel",
                overrideNetworkId: (localUserInfo?.connectionId || userId) + "_headLabel",
                // Use "Owner" persistence - destroyed when player leaves
                persistence: "Owner",
                // Claim ownership for this player
                claimOwnership: true,
                // Pass initial data via customDataStore (proper Connected Lenses pattern)
                customDataStore: customDataStore,
                onSuccess: (networkRoot) => {
                    print("✅ HeadLabelManager: Head label instantiated successfully with Owner persistence");
                    print("📝 Network ID: " + (userId + "_headLabel"));
                    print("📦 CustomDataStore passed with displayName");
                },
                onError: (error) => {
                    print("❌ HeadLabelManager: Error instantiating head label: " + error);
                    this.hasInstantiated = false; // Reset flag on error so it can be retried
                }
            });
        }
        /**
         * Get the local user's head label controller
         */
        getMyHeadLabel() {
            return this.myHeadLabel || null;
        }
        /**
         * Get all remote head labels
         */
        getAllRemoteHeadLabels() {
            return this.allHeadLabels.filter(label => !label.isLocalLabel());
        }
        /**
         * Update the local user's head label text
         */
        updateMyStatus(statusText, subStatus) {
            if (this.myHeadLabel) {
                this.myHeadLabel.updateStatus(statusText, subStatus);
                print(`📝 HeadLabelManager: Updated local status - "${statusText}" / "${subStatus}"`);
            }
            else {
                print("⚠️ HeadLabelManager: Cannot update status - local head label not ready");
            }
        }
        /**
         * Update the local user's availability state
         */
        updateMyAvailability(availabilityState) {
            if (this.myHeadLabel) {
                this.myHeadLabel.updateAvailability(availabilityState);
                print(`📝 HeadLabelManager: Updated availability state to ${availabilityState}`);
            }
            else {
                print("⚠️ HeadLabelManager: Cannot update availability - local head label not ready");
            }
        }
        /**
         * Subscribe to be notified when the local head label is ready
         */
        subscribeToHeadLabelReady(callback) {
            this.onHeadLabelReadyCallbacks.push(callback);
            // If head label is already ready, call the callback immediately
            if (this.myHeadLabel) {
                callback(this.myHeadLabel);
            }
        }
        notifyHeadLabelReady(headLabel) {
            this.onHeadLabelReadyCallbacks.forEach(callback => callback(headLabel));
        }
        /**
         * Get the full path of this scene object for debugging
         */
        getSceneObjectPath() {
            let path = this.sceneObject.name;
            let parent = this.sceneObject.getParent();
            while (parent) {
                path = parent.name + "/" + path;
                parent = parent.getParent();
            }
            return path;
        }
    };
    __setFunctionName(_classThis, "HeadLabelObjectManager");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        HeadLabelObjectManager = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
    })();
    // Static counter to track manager instances
    _classThis.managerCount = 0;
    (() => {
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return HeadLabelObjectManager = _classThis;
})();
exports.HeadLabelObjectManager = HeadLabelObjectManager;
//# sourceMappingURL=HeadLabelObjectManager.js.map