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
exports.HandMenuTester = void 0;
var __selfType = requireType("./HandMenuTester");
function component(target) { target.getTypeName = function () { return __selfType; }; }
/**
 * Simple testing script to invoke the hand menu via tap event
 * This allows testing the hand menu functionality without hand tracking
 */
let HandMenuTester = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var HandMenuTester = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.handMenu = this.handMenu;
            this.enableTapToShow = this.enableTapToShow;
            this.enableTapToExitPing = this.enableTapToExitPing;
            this.pingMenu = this.pingMenu;
        }
        __initialize() {
            super.__initialize();
            this.handMenu = this.handMenu;
            this.enableTapToShow = this.enableTapToShow;
            this.enableTapToExitPing = this.enableTapToExitPing;
            this.pingMenu = this.pingMenu;
        }
        onAwake() {
            this.createEvent("OnStartEvent").bind(() => this.onStart());
        }
        onStart() {
            if (!this.enableTapToShow && !this.enableTapToExitPing) {
                print("🧪 HandMenuTester: All tap testing disabled");
                return;
            }
            if (this.enableTapToShow && !this.handMenu) {
                print("❌ HandMenuTester: No HandMenu component assigned for tap to show");
                return;
            }
            if (this.enableTapToExitPing && !this.pingMenu) {
                print("❌ HandMenuTester: No PingMenu component assigned for tap to exit ping");
                return;
            }
            // Set up tap event
            this.createEvent("TapEvent").bind((eventData) => {
                this.onTapEvent(eventData);
            });
            if (this.enableTapToShow) {
                print("✅ HandMenuTester: Tap to show/hide hand menu enabled");
            }
            if (this.enableTapToExitPing) {
                print("✅ HandMenuTester: Tap to exit ping connections enabled");
            }
            print("💡 HandMenuTester: Tap anywhere on screen to trigger enabled actions");
        }
        onTapEvent(eventData) {
            // Handle exit ping action first (if enabled)
            if (this.enableTapToExitPing && this.pingMenu) {
                this.exitAllPingConnections();
            }
            // Handle hand menu toggle (if enabled)
            if (this.enableTapToShow && this.handMenu) {
                this.toggleHandMenuVisibility();
            }
            // Provide visual feedback in console
            print("🎯 HandMenuTester: Tap detected - executed enabled actions");
        }
        toggleHandMenuVisibility() {
            if (!this.handMenu) {
                return;
            }
            const isCurrentlyEnabled = this.handMenu.sceneObject.enabled;
            if (isCurrentlyEnabled) {
                // Hide the menu
                this.handMenu.sceneObject.enabled = false;
                print("🧪 HandMenuTester: Hand menu hidden via tap");
            }
            else {
                // Show the menu
                this.handMenu.sceneObject.enabled = true;
                print("🧪 HandMenuTester: Hand menu shown via tap");
            }
        }
        exitAllPingConnections() {
            if (!this.pingMenu) {
                return;
            }
            const activeConnections = this.pingMenu.getActivePingConnections();
            if (activeConnections.length === 0) {
                print("🧪 HandMenuTester: No active ping connections to exit");
                return;
            }
            // Exit all active connections (same logic as HandMenuController)
            activeConnections.forEach(userId => {
                this.pingMenu.exitPingConnection(userId);
            });
            print(`🧪 HandMenuTester: Exited ${activeConnections.length} ping connection(s) via tap`);
        }
        /**
         * Public method to manually show the hand menu
         */
        showHandMenu() {
            if (this.handMenu) {
                this.handMenu.sceneObject.enabled = true;
                print("🧪 HandMenuTester: Hand menu shown via script call");
            }
        }
        /**
         * Public method to manually hide the hand menu
         */
        hideHandMenu() {
            if (this.handMenu) {
                this.handMenu.sceneObject.enabled = false;
                print("🧪 HandMenuTester: Hand menu hidden via script call");
            }
        }
        /**
         * Toggle the hand menu state
         */
        toggleHandMenu() {
            if (this.handMenu) {
                const isCurrentlyEnabled = this.handMenu.sceneObject.enabled;
                this.handMenu.sceneObject.enabled = !isCurrentlyEnabled;
                print(`🧪 HandMenuTester: Hand menu ${!isCurrentlyEnabled ? 'shown' : 'hidden'} via toggle`);
            }
        }
    };
    __setFunctionName(_classThis, "HandMenuTester");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        HandMenuTester = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return HandMenuTester = _classThis;
})();
exports.HandMenuTester = HandMenuTester;
//# sourceMappingURL=HandMenuTester.js.map