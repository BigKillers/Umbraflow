/*
 * UmbraMotion, part of Umbraflow
 * Copyright (c) 2026 Big_Killers
 * SPDX-License-Identifier: MIT
 */

import { EasingPreset } from "./easing";

// Each module is one animatable spot in Discord's UI. An enabled module
// contributes a single CSS animation rule (see style.ts) that plays once
// whenever an element matching its selector mounts.
//
// Selector notes, learned against a live client (2026-08-04):
// - Discord's class names look like `word_hash` or `word__hash`. Matching
//   `word_` covers both and skips longer camelCase names (`popoutContent`,
//   `menuItem`) plus other plugins' `vc-*` classes, so keep the trailing
//   underscore.
// - Selectors must not overlap between modules. Two rules on the same
//   element resolve by source order, and the losing module's settings
//   quietly stop doing anything.
// - Verified live: channel switches remount chatContent_*; guild switches
//   remount chatContent_*, the channel list rows, and two transient
//   non-base layer__* elements. Still unverified (element was never open
//   during testing): settings, tooltips, popouts, contextMenu, modals,
//   modalsBackdrop, membersSidebar, threadSidebar.
export type AnimStyle = "fade" | "slide" | "blur" | "scale" | "slip";
export type Direction = "up" | "down" | "left" | "right";

export interface ModuleDef {
    key: string;
    label: string;
    /** CSS selector(s) for the element that should be animated. */
    selector: string;
    defaultEnabled: boolean;
    defaultStyle: AnimStyle;
    defaultDuration: number;
    defaultEasing: EasingPreset;
    defaultDirection?: Direction;
    supportsDirection: boolean;
}

export const MODULES: ModuleDef[] = [
    {
        key: "servers",
        label: "Servers Switch",
        // Non-base layers remount on guild switch, twice per switch, so the
        // default is a plain fade: the replay on the second mount is
        // invisible. Also fires when a full-screen layer like settings gets
        // pushed. The :not() keeps it disjoint from the layers module.
        selector: '[class*="layer_"]:not([class*="baseLayer"])',
        defaultEnabled: true,
        defaultStyle: "fade",
        defaultDuration: 300,
        defaultEasing: "easeOutSine",
        defaultDirection: "up",
        supportsDirection: true
    },
    {
        key: "channels",
        label: "Channels Switch",
        selector: '[class*="chatContent_"]',
        defaultEnabled: true,
        defaultStyle: "slip",
        defaultDuration: 200,
        defaultEasing: "easeOutBack",
        defaultDirection: "up",
        supportsDirection: true
    },
    {
        key: "settings",
        label: "Settings Switch",
        selector: '[class*="contentColumn_"], [class*="standardSidebarView_"]',
        defaultEnabled: true,
        defaultStyle: "slip",
        defaultDuration: 200,
        defaultEasing: "easeOutBack",
        defaultDirection: "up",
        supportsDirection: true
    },
    {
        key: "layers",
        label: "Layers Switch",
        selector: '[class*="baseLayer_"]',
        defaultEnabled: true,
        defaultStyle: "scale",
        defaultDuration: 200,
        defaultEasing: "easeInOutSine",
        supportsDirection: false
    },
    {
        key: "tooltips",
        label: "Tooltips Reveal",
        selector: '[role="tooltip"], [class*="tooltip_"]',
        defaultEnabled: true,
        defaultStyle: "slip",
        defaultDuration: 300,
        defaultEasing: "easeOutSine",
        supportsDirection: false
    },
    {
        key: "popouts",
        label: "Popouts Reveal",
        selector: '[class*="popout_"]',
        defaultEnabled: true,
        defaultStyle: "slip",
        defaultDuration: 200,
        defaultEasing: "easeOutBack",
        supportsDirection: false
    },
    {
        key: "contextMenu",
        label: "Context Menu Reveal",
        // `menu_` rather than bare `menu`, so individual menuItem_* rows
        // don't each animate on top of the container.
        selector: '[role="menu"], [class*="menu_"]',
        defaultEnabled: true,
        defaultStyle: "scale",
        defaultDuration: 150,
        defaultEasing: "easeOutQuart",
        supportsDirection: false
    },
    {
        key: "messages",
        label: "Messages Reveal",
        // Discord mounts a fresh element for the same message more than once
        // (optimistic send, then the confirmed swap, then grouping recalc),
        // so the animation replays. A quick fade hides that; a big slide
        // looks like it played twice.
        selector: '[class*="messageListItem_"]',
        defaultEnabled: true,
        defaultStyle: "fade",
        defaultDuration: 150,
        defaultEasing: "easeOutSine",
        defaultDirection: "right",
        supportsDirection: true
    },
    {
        key: "channelList",
        label: "Channel List Reveal",
        // DM rows are li.channel_*, guild rows are li.containerDefault_*.
        // Both li-scoped so inner wrappers can't double-animate.
        selector: 'li[class*="channel_"], li[class*="containerDefault"]',
        defaultEnabled: true,
        defaultStyle: "slide",
        defaultDuration: 400,
        defaultEasing: "easeInOutQuart",
        defaultDirection: "right",
        supportsDirection: true
    },
    {
        key: "modals",
        label: "Modals Reveal",
        selector: '[role="dialog"], [class*="modal_"]',
        defaultEnabled: true,
        defaultStyle: "slip",
        defaultDuration: 200,
        defaultEasing: "easeOutBack",
        supportsDirection: false
    },
    {
        key: "modalsBackdrop",
        label: "Modals Backdrop Reveal",
        selector: '[class*="backdrop_"]',
        defaultEnabled: true,
        defaultStyle: "fade",
        defaultDuration: 200,
        defaultEasing: "easeInOutQuart",
        supportsDirection: false
    },
    {
        key: "membersSidebar",
        label: "Members Sidebar Reveal",
        selector: '[class*="membersWrap_"], [class*="membersGroup_"]',
        defaultEnabled: false,
        defaultStyle: "slide",
        defaultDuration: 400,
        defaultEasing: "easeInOutQuart",
        defaultDirection: "left",
        supportsDirection: true
    },
    {
        // One module, not two. Opening a sidebar and switching between
        // sidebars both just mount this element, and CSS can't tell those
        // apart, so pretending they're separate settings would leave one of
        // them dead.
        key: "threadSidebar",
        label: "Thread Sidebar",
        selector: '[class*="sidebar_"][class*="chat_"]',
        defaultEnabled: true,
        defaultStyle: "fade",
        defaultDuration: 200,
        defaultEasing: "easeInOutSine",
        defaultDirection: "left",
        supportsDirection: true
    }
];
