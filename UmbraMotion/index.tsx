/*
 * UmbraMotion, part of Umbraflow
 * Copyright (c) 2026 Big_Killers
 * SPDX-License-Identifier: MIT
 */

import { createAndAppendStyle } from "@utils/css";
import definePlugin from "@utils/types";

import { onSettingsChanged, settings } from "./settings";
import { buildStylesheet } from "./style";

// Enter-only, on purpose. An earlier version faked exit animations by
// reinserting DOM nodes React had just removed, holding them in place long
// enough to animate out. React removes and replaces nodes constantly as
// ordinary re-render churn, not just when something closes, so that
// approach fought React's reconciliation and broke rendering across the
// app. Don't bring exit animations back without a mechanism that never
// reinserts removed nodes. The current design injects one generated
// stylesheet and never touches the DOM afterward.

let styleEl: HTMLStyleElement | null = null;
let unsubscribe: (() => void) | null = null;

function refresh() {
    if (styleEl) styleEl.textContent = buildStylesheet();
}

export default definePlugin({
    name: "UmbraMotion",
    description: "Enter animations for Discord: menus, modals, popouts, tooltips, messages and more, each with its own style, duration, easing and direction.",
    authors: [{ name: "Big_Killers", id: 0n }],
    tags: ["Appearance", "Fun"],

    settings,

    start() {
        styleEl = createAndAppendStyle("VcUmbraMotion", document.head);
        styleEl.textContent = buildStylesheet();

        unsubscribe = onSettingsChanged(refresh);
    },

    stop() {
        unsubscribe?.();
        unsubscribe = null;

        styleEl?.remove();
        styleEl = null;
    }
});
