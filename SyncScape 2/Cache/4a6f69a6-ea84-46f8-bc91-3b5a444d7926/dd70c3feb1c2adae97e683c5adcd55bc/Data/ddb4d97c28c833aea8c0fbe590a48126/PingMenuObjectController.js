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
exports.PingMenuObjectController = void 0;
var __selfType = requireType("./PingMenuObjectController");
function component(target) { target.getTypeName = function () { return __selfType; }; }
/**
 * Controller for the ping menu UI that appears when a user receives a ping request.
 * Handles accept/reject button interactions and communicates with the main ping system.
 */
let PingMenuObjectController = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var PingMenuObjectController = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.pingMenuReferences = this.pingMenuReferences;
            this.autoExpireTime = this.autoExpireTime;
            this.pingData = null;
            this.pingMenu = null;
            this.expireTimer = null;
        }
        __initialize() {
            super.__initialize();
            this.pingMenuReferences = this.pingMenuReferences;
            this.autoExpireTime = this.autoExpireTime;
            this.pingData = null;
            this.pingMenu = null;
            this.expireTimer = null;
        }
        onAwake() {
            this.createEvent("OnStartEvent").bind(() => this.onStart());
        }
        onStart() {
            if (!this.pingMenuReferences) {
                print("❌ PingMenuObjectController: No ping menu references assigned");
                return;
            }
            this.setupButtonHandlers();
        }
        setupButtonHandlers() {
            // Connect accept button
            if (this.pingMenuReferences.acceptButton) {
                this.pingMenuReferences.acceptButton.onTriggerUp.add(() => {
                    this.onAcceptButtonPressed();
                });
                print("✅ PingMenuObjectController: Connected accept button");
            }
            // Connect reject button
            if (this.pingMenuReferences.rejectButton) {
                this.pingMenuReferences.rejectButton.onTriggerUp.add(() => {
                    this.onRejectButtonPressed();
                });
                print("❌ PingMenuObjectController: Connected reject button");
            }
        }
        /**
         * Called by PingMenu to set up this ping menu with request data
         */
        setupPingRequest(pingData, pingMenu) {
            print(`🎯 PingMenuObjectController: setupPingRequest called`);
            print(`🔍 PingMenuObjectController: pingData: ${pingData ? 'RECEIVED' : 'NULL'}`);
            print(`🔍 PingMenuObjectController: pingMenu: ${pingMenu ? 'RECEIVED' : 'NULL'}`);
            this.pingData = pingData;
            this.pingMenu = pingMenu;
            print(`📨 PingMenuObjectController: Setting up ping request from user ${pingData.from}`);
            // Update UI to show who is pinging
            this.updateUIForPingRequest();
            // Start auto-expire timer
            this.startAutoExpireTimer();
        }
        updateUIForPingRequest() {
            // Update text if there's a text component showing the pinger's name
            if (this.pingMenuReferences.pingerNameText && this.pingData) {
                // Try to get a more user-friendly name if possible
                const pingerName = this.getPingerDisplayName();
                this.pingMenuReferences.pingerNameText.text = `${pingerName} wants to connect`;
            }
            // Update any other UI elements as needed
            print(`🎨 PingMenuObjectController: Updated UI for ping from ${this.pingData.from}`);
        }
        getPingerDisplayName() {
            // Try to get display name from ping data, fallback to user ID
            if (this.pingData && this.pingData.from) {
                // If pingData contains displayName, use it; otherwise use the ID
                return this.pingData.displayName || this.pingData.from || "Unknown User";
            }
            return "Unknown User";
        }
        startAutoExpireTimer() {
            if (this.expireTimer) {
                this.expireTimer.reset(this.autoExpireTime);
            }
            else {
                this.expireTimer = this.createEvent("DelayedCallbackEvent");
                this.expireTimer.bind(() => {
                    this.onAutoExpire();
                });
                this.expireTimer.reset(this.autoExpireTime);
            }
            print(`⏰ PingMenuObjectController: Auto-expire timer set for ${this.autoExpireTime} seconds`);
        }
        onAutoExpire() {
            print("⏰ PingMenuObjectController: Ping request auto-expired");
            // Auto-reject the ping
            this.handlePingResponse(false);
        }
        onAcceptButtonPressed() {
            print("✅ PingMenuObjectController: Accept button pressed");
            this.handlePingResponse(true);
        }
        onRejectButtonPressed() {
            print("❌ PingMenuObjectController: Reject button pressed");
            this.handlePingResponse(false);
        }
        handlePingResponse(accepted) {
            print(`🔍 PingMenuObjectController: handlePingResponse called with accepted: ${accepted}`);
            print(`🔍 PingMenuObjectController: pingMenu is ${this.pingMenu ? 'ASSIGNED' : 'NULL'}`);
            print(`🔍 PingMenuObjectController: pingData is ${this.pingData ? 'ASSIGNED' : 'NULL'}`);
            // Cancel auto-expire timer
            if (this.expireTimer) {
                this.expireTimer.cancel();
                this.expireTimer = null;
            }
            // Send response through ping system
            if (this.pingMenu && this.pingData) {
                print(`🎯 PingMenuObjectController: Calling respondToPing on pingMenu`);
                this.pingMenu.respondToPing(this.pingData, accepted);
            }
            else {
                print(`❌ PingMenuObjectController: Cannot call respondToPing - pingMenu: ${this.pingMenu ? 'OK' : 'NULL'}, pingData: ${this.pingData ? 'OK' : 'NULL'}`);
            }
            // Provide user feedback
            this.showResponseFeedback(accepted);
            // Close this menu (will be handled by ping system controller)
            print(`📨 PingMenuObjectController: Ping ${accepted ? "accepted" : "rejected"}`);
        }
        showResponseFeedback(accepted) {
            // You could add visual/audio feedback here
            const feedbackMessage = accepted ? "Connection established!" : "Ping declined";
            print(`💫 PingMenuObjectController: ${feedbackMessage}`);
            // Visual feedback could be added here if needed
            // For now, we rely on the text feedback and the main ping material system
        }
        /**
         * Called externally to force close this ping menu
         */
        closePingMenu() {
            // Cancel any active timers
            if (this.expireTimer) {
                this.expireTimer.cancel();
                this.expireTimer = null;
            }
            // Destroy the scene object
            this.sceneObject.destroy();
            print("🗑️ PingMenuObjectController: Ping menu closed");
        }
    };
    __setFunctionName(_classThis, "PingMenuObjectController");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        PingMenuObjectController = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return PingMenuObjectController = _classThis;
})();
exports.PingMenuObjectController = PingMenuObjectController;
//# sourceMappingURL=PingMenuObjectController.js.map