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
exports.HandObjectManager = void 0;
var __selfType = requireType("./HandObjectManager");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const SessionController_1 = require("SpectaclesSyncKit.lspkg/Core/SessionController");
const HandObjectController_1 = require("./HandObjectController");
let HandObjectManager = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var HandObjectManager = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.instantiator = this.instantiator;
            this.leftHandPrefab = this.leftHandPrefab;
            this.rightHandPrefab = this.rightHandPrefab;
            this.testingMode = this.testingMode;
            this.allHands = [];
            // Callbacks for external systems
            this.onHandsReadyCallbacks = [];
        }
        __initialize() {
            super.__initialize();
            this.instantiator = this.instantiator;
            this.leftHandPrefab = this.leftHandPrefab;
            this.rightHandPrefab = this.rightHandPrefab;
            this.testingMode = this.testingMode;
            this.allHands = [];
            // Callbacks for external systems
            this.onHandsReadyCallbacks = [];
        }
        subscribe(handObject) {
            this.allHands.push(handObject);
            if (handObject.isLocalHand()) {
                if (handObject.getHandType() === "left") {
                    this.myLeftHand = handObject;
                    print("📝 Subscribed to local left hand");
                }
                else if (handObject.getHandType() === "right") {
                    this.myRightHand = handObject;
                    print("📝 Subscribed to local right hand");
                }
                // Check if both hands are ready
                if (this.myLeftHand && this.myRightHand) {
                    print("🙌 Both local hands are ready!");
                    this.notifyHandsReady(this.myLeftHand, this.myRightHand);
                }
            }
            this.createEvent("UpdateEvent").bind(() => this.onUpdate());
        }
        instantiateHandObjects() {
            print("Instantiating hand objects for " + SessionController_1.SessionController.getInstance().getLocalUserName());
            // Instantiate left hand
            this.instantiator.instantiate(this.leftHandPrefab, {
                onSuccess: (networkRoot) => {
                    print("✅ Left hand instantiated successfully");
                    // Set testing mode on the hand controller
                    const handController = networkRoot.sceneObject.getComponent(HandObjectController_1.HandObjectController.getTypeName());
                    if (handController) {
                        handController.testingMode = this.testingMode;
                    }
                },
                onError: (error) => {
                    print("❌ Error instantiating left hand: " + error);
                }
            });
            // Instantiate right hand
            this.instantiator.instantiate(this.rightHandPrefab, {
                onSuccess: (networkRoot) => {
                    print("✅ Right hand instantiated successfully");
                    // Set testing mode on the hand controller
                    const handController = networkRoot.sceneObject.getComponent(HandObjectController_1.HandObjectController.getTypeName());
                    if (handController) {
                        handController.testingMode = this.testingMode;
                    }
                },
                onError: (error) => {
                    print("❌ Error instantiating right hand: " + error);
                }
            });
        }
        onUpdate() {
            // Update all local hands
            if (this.myLeftHand) {
                this.myLeftHand.onUpdate();
            }
            if (this.myRightHand) {
                this.myRightHand.onUpdate();
            }
        }
        // Public methods for external systems
        getMyLeftHand() {
            return this.myLeftHand || null;
        }
        getMyRightHand() {
            return this.myRightHand || null;
        }
        getMyHandsCenter() {
            if (!this.myLeftHand || !this.myRightHand) {
                return null;
            }
            const leftPos = this.myLeftHand.getWorldPosition();
            const rightPos = this.myRightHand.getWorldPosition();
            return new vec3((leftPos.x + rightPos.x) / 2, (leftPos.y + rightPos.y) / 2, (leftPos.z + rightPos.z) / 2);
        }
        getAllRemoteHands() {
            return this.allHands.filter(hand => !hand.isLocalHand());
        }
        subscribeToHandsReady(callback) {
            this.onHandsReadyCallbacks.push(callback);
        }
        notifyHandsReady(leftHand, rightHand) {
            this.onHandsReadyCallbacks.forEach(callback => callback(leftHand, rightHand));
        }
        onStart() {
            SessionController_1.SessionController.getInstance().notifyOnReady(() => {
                this.instantiator.notifyOnReady(() => {
                    this.instantiateHandObjects();
                });
            });
        }
        onAwake() {
            this.createEvent("OnStartEvent").bind(() => this.onStart());
        }
    };
    __setFunctionName(_classThis, "HandObjectManager");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        HandObjectManager = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return HandObjectManager = _classThis;
})();
exports.HandObjectManager = HandObjectManager;
//# sourceMappingURL=HandObjectManager.js.map