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
exports.HandMenuController = void 0;
var __selfType = requireType("./HandMenuController");
function component(target) { target.getTypeName = function () { return __selfType; }; }
const HeadLabelUpdater_1 = require("../HeadLabel/HeadLabelUpdater");
const HeadLabelObjectController_1 = require("../HeadLabel/HeadLabelObjectController");
/**
 * Controller that connects the hand menu UI to the head label system.
 * Handles user input from the hand menu and updates the head label accordingly.
 */
let HandMenuController = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var HandMenuController = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.handMenuReferences = this.handMenuReferences;
            this.defaultStatusMessages = this.defaultStatusMessages;
            this.subStatusOptions = this.subStatusOptions;
            this.pingMenu = this.pingMenu;
            this.currentStatusText = "Hello from Spectacles!";
            this.currentSubStatus = "Available";
            this.currentAvailability = HeadLabelObjectController_1.AvailabilityState.Available;
        }
        __initialize() {
            super.__initialize();
            this.handMenuReferences = this.handMenuReferences;
            this.defaultStatusMessages = this.defaultStatusMessages;
            this.subStatusOptions = this.subStatusOptions;
            this.pingMenu = this.pingMenu;
            this.currentStatusText = "Hello from Spectacles!";
            this.currentSubStatus = "Available";
            this.currentAvailability = HeadLabelObjectController_1.AvailabilityState.Available;
        }
        onAwake() {
            this.createEvent("OnStartEvent").bind(() => this.onStart());
        }
        onStart() {
            if (!this.handMenuReferences) {
                print("⚠️ HandMenuController: No hand menu references assigned");
                return;
            }
            // Wait for HeadLabelUpdater to be available
            this.waitForHeadLabelUpdater();
        }
        waitForHeadLabelUpdater() {
            const headLabelUpdater = HeadLabelUpdater_1.HeadLabelUpdater.getInstance();
            if (!headLabelUpdater) {
                print("⏳ HandMenuController: Waiting for HeadLabelUpdater...");
                // Retry in next frame
                const retryEvent = this.createEvent("DelayedCallbackEvent");
                retryEvent.bind(() => {
                    this.waitForHeadLabelUpdater();
                });
                retryEvent.reset(0.1);
                return;
            }
            print("✅ HandMenuController: HeadLabelUpdater found, setting up...");
            // Wait for head label to be ready before setting up UI
            headLabelUpdater.onMyHeadLabelReady(() => {
                print("✅ HandMenuController: Head label ready, setting up UI connections");
                // Get current values from head label via manager
                const headLabelData = headLabelUpdater.getMyHeadLabelData();
                if (headLabelData) {
                    this.currentStatusText = headLabelData.statusText;
                    this.currentSubStatus = headLabelData.subStatus;
                    this.currentAvailability = headLabelData.availability;
                }
                this.setupUIConnections();
                this.updateUIFromCurrentState();
            });
        }
        setupUIConnections() {
            // Connect status text input field
            if (this.handMenuReferences.textStatusInputField) {
                // Set initial text
                this.handMenuReferences.textStatusInputField.text = this.currentStatusText;
                // Listen for text changes
                this.handMenuReferences.textStatusInputField.onTextChanged.add((newText) => {
                    this.onStatusTextChanged(newText);
                });
                print("📝 HandMenuController: Connected status text input field");
            }
            // Connect update status button
            if (this.handMenuReferences.updateStatusButton) {
                this.handMenuReferences.updateStatusButton.onTriggerUp.add(() => {
                    this.onUpdateStatusButtonPressed();
                });
                print("📝 HandMenuController: Connected update status button");
            }
            // Connect availability toggle group
            if (this.handMenuReferences.switchToggleGroupSubStatus) {
                // Set initial selection - turn on the appropriate toggle using the toggle() method
                const toggles = this.handMenuReferences.switchToggleGroupSubStatus.toggleables;
                if (toggles && toggles.length > this.currentAvailability) {
                    // Turn off all toggles first
                    toggles.forEach(toggle => toggle.isOn = false);
                    // Then turn on the correct one using toggle() method for explicit change
                    toggles[this.currentAvailability].toggle(true);
                }
                // Listen for selection changes
                this.handMenuReferences.switchToggleGroupSubStatus.onToggleSelected.add((args) => {
                    // Find index of selected toggle
                    const toggles = this.handMenuReferences.switchToggleGroupSubStatus.toggleables;
                    const index = toggles.indexOf(args.toggleable);
                    if (index !== -1) {
                        this.onAvailabilityChanged(index);
                    }
                });
                print("📝 HandMenuController: Connected availability toggle group");
            }
            // Connect close button
            if (this.handMenuReferences.closeButton) {
                this.handMenuReferences.closeButton.onTriggerUp.add(() => {
                    this.onCloseButtonPressed();
                });
                print("📝 HandMenuController: Connected close button");
            }
            // Connect exit ping button
            if (this.handMenuReferences.exitPingButton) {
                this.handMenuReferences.exitPingButton.onTriggerUp.add(() => {
                    this.onExitPingButtonPressed();
                });
                print("📝 HandMenuController: Connected exit ping button");
            }
        }
        updateUIFromCurrentState() {
            // Update text input field
            if (this.handMenuReferences.textStatusInputField) {
                this.handMenuReferences.textStatusInputField.text = this.currentStatusText;
            }
            // Update availability toggle
            if (this.handMenuReferences.switchToggleGroupSubStatus) {
                const toggles = this.handMenuReferences.switchToggleGroupSubStatus.toggleables;
                if (toggles && toggles.length > this.currentAvailability) {
                    // Turn off all toggles first
                    toggles.forEach(toggle => toggle.isOn = false);
                    // Then turn on the correct one using toggle() method for explicit change
                    toggles[this.currentAvailability].toggle(true);
                }
            }
        }
        onStatusTextChanged(newText) {
            if (!newText || newText.trim() === "") {
                // Use a random default message if empty
                const randomIndex = Math.floor(Math.random() * this.defaultStatusMessages.length);
                newText = this.defaultStatusMessages[randomIndex];
                // Update the input field with the default message
                if (this.handMenuReferences.textStatusInputField) {
                    this.handMenuReferences.textStatusInputField.text = newText;
                }
            }
            this.currentStatusText = newText;
            print(`📝 HandMenuController: Status text changed to "${newText}"`);
            // Don't update immediately - wait for update button press
        }
        onUpdateStatusButtonPressed() {
            print("🔄 HandMenuController: Update status button pressed");
            print(`🔍 HandMenuController: Current status text: "${this.currentStatusText}"`);
            print(`🔍 HandMenuController: Current sub-status: "${this.currentSubStatus}"`);
            const headLabelUpdater = HeadLabelUpdater_1.HeadLabelUpdater.getInstance();
            if (!headLabelUpdater) {
                print("❌ HandMenuController: HeadLabelUpdater not available");
                this.provideFeedback("Error: System not ready");
                return;
            }
            // Update head label with current values via manager
            headLabelUpdater.updateMyHeadLabelStatus(this.currentStatusText, this.currentSubStatus);
            // Provide visual feedback
            this.provideFeedback("Status Updated!");
        }
        onAvailabilityChanged(index) {
            this.currentAvailability = index;
            this.currentSubStatus = this.subStatusOptions[index] || "Available";
            print(`📝 HandMenuController: Availability changed to ${this.currentSubStatus} (${index})`);
            const headLabelUpdater = HeadLabelUpdater_1.HeadLabelUpdater.getInstance();
            if (!headLabelUpdater) {
                print("❌ HandMenuController: HeadLabelUpdater not available");
                return;
            }
            // Update head label immediately for availability changes
            headLabelUpdater.updateMyHeadLabelAvailability(this.currentAvailability);
            headLabelUpdater.updateMyHeadLabelStatus(this.currentStatusText, this.currentSubStatus);
            // Provide visual feedback
            this.provideFeedback(`Status: ${this.currentSubStatus}`);
        }
        onExitPingButtonPressed() {
            print("🚪 HandMenuController: Exit ping button pressed");
            if (!this.pingMenu) {
                print("❌ HandMenuController: No ping system controller assigned");
                this.provideFeedback("Ping system not available");
                return;
            }
            // Get all active ping connections and exit them
            const activeConnections = this.pingMenu.getActivePingConnections();
            if (activeConnections.length === 0) {
                this.provideFeedback("No active ping connections");
                return;
            }
            // Exit all active connections
            activeConnections.forEach(userId => {
                this.pingMenu.exitPingConnection(userId);
            });
            // Reset local head label materials to default immediately
            const headLabelUpdater = HeadLabelUpdater_1.HeadLabelUpdater.getInstance();
            if (headLabelUpdater) {
                const headLabelManager = headLabelUpdater.getHeadLabelManager();
                if (headLabelManager) {
                    const myHeadLabel = headLabelManager.getMyHeadLabel();
                    if (myHeadLabel) {
                        print("🎨 HandMenuController: Resetting local head label material to default");
                        myHeadLabel.updatePingVisual(false);
                    }
                }
            }
            // Also reset hand menu ping material targets to default
            if (this.handMenuReferences.pingDefaultMaterial &&
                this.handMenuReferences.pingMaterialTargets &&
                this.handMenuReferences.pingMaterialTargets.length > 0) {
                this.handMenuReferences.pingMaterialTargets.forEach((target, index) => {
                    if (target) {
                        const renderMeshVisual = target.getComponent("Component.RenderMeshVisual");
                        if (renderMeshVisual) {
                            renderMeshVisual.mainMaterial = this.handMenuReferences.pingDefaultMaterial;
                            print(`🎨 HandMenuController: Reset hand menu target ${index} to default material`);
                        }
                    }
                });
            }
            this.provideFeedback(`Exited ${activeConnections.length} ping connection(s)`);
            print(`🚪 HandMenuController: Exited ${activeConnections.length} ping connections`);
        }
        onCloseButtonPressed() {
            print("❌ HandMenuController: Close button pressed");
            // Simply disable this scene object to close the menu
            this.sceneObject.enabled = false;
            print("✅ HandMenuController: Menu closed");
        }
        provideFeedback(message) {
            print(`💫 HandMenuController: Feedback - ${message}`);
            // Apply visual feedback material if available
            if (this.handMenuReferences.pingAcceptedMaterial &&
                this.handMenuReferences.pingMaterialTargets &&
                this.handMenuReferences.pingMaterialTargets.length > 0) {
                let targetsUpdated = 0;
                const renderMeshVisuals = [];
                // Apply feedback material to all targets using RenderMeshVisual Material 1
                this.handMenuReferences.pingMaterialTargets.forEach((target, index) => {
                    if (target) {
                        const renderMeshVisual = target.getComponent("Component.RenderMeshVisual");
                        if (renderMeshVisual) {
                            // Set Material 1 as shown in the screenshot
                            renderMeshVisual.mainMaterial = this.handMenuReferences.pingAcceptedMaterial;
                            renderMeshVisuals.push(renderMeshVisual);
                            targetsUpdated++;
                            print(`🎨 HandMenuController: Applied feedback material to target ${index} RenderMeshVisual.mainMaterial`);
                        }
                        else {
                            print(`⚠️ HandMenuController: Ping material target ${index} has no RenderMeshVisual component`);
                        }
                    }
                    else {
                        print(`⚠️ HandMenuController: Ping material target ${index} is null`);
                    }
                });
                // Reset to default material after a short delay (0.5 seconds)
                if (renderMeshVisuals.length > 0) {
                    const resetEvent = this.createEvent("DelayedCallbackEvent");
                    resetEvent.bind(() => {
                        renderMeshVisuals.forEach(renderMeshVisual => {
                            if (renderMeshVisual && this.handMenuReferences.pingDefaultMaterial) {
                                renderMeshVisual.mainMaterial = this.handMenuReferences.pingDefaultMaterial;
                            }
                        });
                        print(`🎨 HandMenuController: Reset ${renderMeshVisuals.length} targets to default material after feedback`);
                    });
                    resetEvent.reset(0.5);
                }
                print(`🎨 HandMenuController: Applied feedback material to ${targetsUpdated}/${this.handMenuReferences.pingMaterialTargets.length} hand menu targets`);
            }
            // You could also trigger sound effects or other feedback here
        }
        /**
         * Public method to set a custom status message
         */
        setStatusMessage(message) {
            this.currentStatusText = message;
            if (this.handMenuReferences.textStatusInputField) {
                this.handMenuReferences.textStatusInputField.text = message;
            }
            const headLabelUpdater = HeadLabelUpdater_1.HeadLabelUpdater.getInstance();
            if (headLabelUpdater) {
                headLabelUpdater.updateMyHeadLabelStatus(message, this.currentSubStatus);
            }
        }
        /**
         * Public method to set availability
         */
        setAvailability(state) {
            this.currentAvailability = state;
            this.currentSubStatus = this.subStatusOptions[state] || "Available";
            if (this.handMenuReferences.switchToggleGroupSubStatus) {
                const toggles = this.handMenuReferences.switchToggleGroupSubStatus.toggleables;
                if (toggles && toggles.length > state) {
                    // Turn off all toggles first
                    toggles.forEach(toggle => toggle.isOn = false);
                    // Then turn on the correct one using toggle() method for explicit change
                    toggles[state].toggle(true);
                }
            }
            const headLabelUpdater = HeadLabelUpdater_1.HeadLabelUpdater.getInstance();
            if (headLabelUpdater) {
                headLabelUpdater.updateMyHeadLabelAvailability(state);
                headLabelUpdater.updateMyHeadLabelStatus(this.currentStatusText, this.currentSubStatus);
            }
        }
    };
    __setFunctionName(_classThis, "HandMenuController");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        HandMenuController = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return HandMenuController = _classThis;
})();
exports.HandMenuController = HandMenuController;
//# sourceMappingURL=HandMenuController.js.map