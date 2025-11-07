"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.RealtimeStoreKeys = void 0;
const SessionController_1 = require("SpectaclesSyncKit.lspkg/Core/SessionController");
//The RealtimeStoreKeys namespace defines constants and utility functions for
// managing and accessing hand position data in a real-time collaborative environment
var RealtimeStoreKeys;
(function (RealtimeStoreKeys) {
    // Constant string used as a prefix for hand position keys
    RealtimeStoreKeys.HAND_POSITION = "HAND_POSITION";
    // Generates a key for the current user's hand position data
    RealtimeStoreKeys.getCurrentUserHandPositionKey = () => {
        return RealtimeStoreKeys.getHandPositionKey(SessionController_1.SessionController.getInstance().getLocalUserInfo());
    };
    // Generates a key for a specific user's hand position data using their connection ID
    RealtimeStoreKeys.getHandPositionKey = (user) => {
        return RealtimeStoreKeys.HAND_POSITION + user.connectionId;
    };
    // Constant string used as a prefix for Kame Hame Ha data keys
    RealtimeStoreKeys.KAME_HAME_HA = "KAME_HAME_HA";
    // Generates a key for the current user's Kame Hame Ha data
    RealtimeStoreKeys.getCurrentUserKameHameHaKey = () => {
        return RealtimeStoreKeys.getKameHameHaKey(SessionController_1.SessionController.getInstance().getLocalUserInfo());
    };
    // Generates a key for a specific user's Kame Hame Ha data using their connection ID
    RealtimeStoreKeys.getKameHameHaKey = (user) => {
        return RealtimeStoreKeys.KAME_HAME_HA + user.connectionId;
    };
    // Constant string used as a prefix for head label data keys
    RealtimeStoreKeys.HEAD_LABEL = "HEAD_LABEL";
    // Generates a key for the current user's head label data
    RealtimeStoreKeys.getCurrentUserHeadLabelKey = () => {
        return RealtimeStoreKeys.getHeadLabelKey(SessionController_1.SessionController.getInstance().getLocalUserInfo());
    };
    // Generates a key for a specific user's head label data using their connection ID
    RealtimeStoreKeys.getHeadLabelKey = (user) => {
        return RealtimeStoreKeys.HEAD_LABEL + user.connectionId;
    };
})(RealtimeStoreKeys || (exports.RealtimeStoreKeys = RealtimeStoreKeys = {}));
//# sourceMappingURL=RealtimeStoreKeys.js.map