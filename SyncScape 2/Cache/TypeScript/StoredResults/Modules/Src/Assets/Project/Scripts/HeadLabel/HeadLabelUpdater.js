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
exports.HeadLabelUpdater = void 0;
var __selfType = requireType("./HeadLabelUpdater");
function component(target) { target.getTypeName = function () { return __selfType; }; }
/**
 * Bridge that connects local hand menu UI to synced head label data.
 * Provides a clean interface for hand menu to update the local player's head label,
 * which then syncs across all players via StorageProperties.
 */
let HeadLabelUpdater = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var HeadLabelUpdater = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.headLabelObjectManager = this.headLabelObjectManager;
        }
        __initialize() {
            super.__initialize();
            this.headLabelObjectManager = this.headLabelObjectManager;
        }
        onAwake() {
            // Set up singleton
            if (HeadLabelUpdater.instance) {
                print("⚠️ HeadLabelUpdater: Multiple instances detected! Using first instance.");
                return;
            }
            HeadLabelUpdater.instance = this;
            this.createEvent("OnStartEvent").bind(() => this.onStart());
        }
        onStart() {
            print("✅ HeadLabelUpdater: Initialized successfully");
            // Validate required component
            if (!this.headLabelObjectManager) {
                print("❌ HeadLabelUpdater: Missing HeadLabelObjectManager reference");
            }
            else {
                print("✅ HeadLabelUpdater: HeadLabelObjectManager connected");
            }
        }
        /**
         * Get the singleton instance of HeadLabelUpdater
         */
        static getInstance() {
            return HeadLabelUpdater.instance || null;
        }
        /**
         * Update the local player's head label status (called from hand menu)
         */
        updateMyHeadLabelStatus(statusText, subStatus) {
            if (!this.headLabelObjectManager) {
                print("❌ HeadLabelUpdater: Cannot update status - HeadLabelObjectManager not available");
                return;
            }
            print(`📝 HeadLabelUpdater: Updating local player status - "${statusText}" / "${subStatus}"`);
            this.headLabelObjectManager.updateMyStatus(statusText, subStatus);
        }
        /**
         * Update the local player's availability state (called from hand menu)
         */
        updateMyHeadLabelAvailability(availabilityState) {
            if (!this.headLabelObjectManager) {
                print("❌ HeadLabelUpdater: Cannot update availability - HeadLabelObjectManager not available");
                return;
            }
            print(`📝 HeadLabelUpdater: Updating local player availability to ${availabilityState}`);
            this.headLabelObjectManager.updateMyAvailability(availabilityState);
        }
        /**
         * Get the local player's current head label data
         */
        getMyHeadLabelData() {
            if (!this.headLabelObjectManager) {
                return null;
            }
            const myHeadLabel = this.headLabelObjectManager.getMyHeadLabel();
            if (!myHeadLabel) {
                return null;
            }
            return {
                statusText: myHeadLabel.getStatusText(),
                subStatus: myHeadLabel.getSubStatusText(),
                availability: myHeadLabel.getAvailability()
            };
        }
        /**
         * Register a callback for when the local head label is ready
         */
        onMyHeadLabelReady(callback) {
            if (!this.headLabelObjectManager) {
                print("❌ HeadLabelUpdater: Cannot register callback - HeadLabelObjectManager not available");
                return;
            }
            this.headLabelObjectManager.subscribeToHeadLabelReady(() => {
                print("✅ HeadLabelUpdater: Local head label is ready");
                callback();
            });
        }
        /**
         * Check if head label system is ready
         */
        isHeadLabelSystemReady() {
            return this.headLabelObjectManager !== null &&
                this.headLabelObjectManager.getMyHeadLabel() !== null;
        }
        /**
         * Get head label manager for advanced use cases
         */
        getHeadLabelManager() {
            return this.headLabelObjectManager;
        }
    };
    __setFunctionName(_classThis, "HeadLabelUpdater");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        HeadLabelUpdater = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return HeadLabelUpdater = _classThis;
})();
exports.HeadLabelUpdater = HeadLabelUpdater;
//# sourceMappingURL=HeadLabelUpdater.js.map