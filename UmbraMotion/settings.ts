/*
 * Vencord, a Discord client mod
 * Copyright (c) 2026 Big_Killers
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import { definePluginSettings } from "@api/Settings";
import { OptionType } from "@utils/types";

import { EASING_OPTIONS, EasingPreset } from "./easing";
import { AnimStyle, Direction, MODULES } from "./modules";

const STYLE_OPTIONS: { label: string; value: AnimStyle; }[] = [
    { label: "Fade", value: "fade" },
    { label: "Slide", value: "slide" },
    { label: "Blur", value: "blur" },
    { label: "Scale", value: "scale" },
    { label: "Slip (small pop)", value: "slip" }
];

const DIRECTION_OPTIONS: { label: string; value: Direction; }[] = [
    { label: "Up", value: "up" },
    { label: "Down", value: "down" },
    { label: "Left", value: "left" },
    { label: "Right", value: "right" }
];

const DURATION_MARKERS = [100, 150, 200, 300, 400, 600, 800, 1000, 1500, 2000];

// style.ts rebuilds the stylesheet when a setting changes. It gets notified
// through this listener list instead of importing back into this file,
// which would be a circular import.
type Listener = () => void;
const listeners = new Set<Listener>();

/** Register a settings-change listener. Returns an unsubscribe function. */
export function onSettingsChanged(fn: Listener): () => void {
    listeners.add(fn);
    return () => listeners.delete(fn);
}

function notifyChanged() {
    listeners.forEach(fn => fn());
}

// Generates the enabled/style/duration/easing(/direction) settings for every
// module from the MODULES table, instead of hand-writing 50+ blocks.
function buildModuleSettings() {
    const entries: Record<string, any> = {};

    for (const mod of MODULES) {
        entries[`${mod.key}_enabled`] = {
            type: OptionType.BOOLEAN,
            description: `Animate ${mod.label}`,
            default: mod.defaultEnabled,
            onChange: notifyChanged
        };
        entries[`${mod.key}_style`] = {
            type: OptionType.SELECT,
            description: `Animation style — ${mod.label}`,
            options: STYLE_OPTIONS.map(o => ({ ...o, default: o.value === mod.defaultStyle })),
            onChange: notifyChanged
        };
        entries[`${mod.key}_duration`] = {
            type: OptionType.SLIDER,
            description: `Duration (ms) — ${mod.label}`,
            markers: DURATION_MARKERS,
            default: mod.defaultDuration,
            stickToMarkers: false,
            onChange: notifyChanged
        };
        entries[`${mod.key}_easing`] = {
            type: OptionType.SELECT,
            description: `Easing curve — ${mod.label}`,
            options: EASING_OPTIONS.map(o => ({ ...o, default: o.value === mod.defaultEasing })),
            onChange: notifyChanged
        };

        if (mod.supportsDirection) {
            entries[`${mod.key}_direction`] = {
                type: OptionType.SELECT,
                description: `Direction — ${mod.label}`,
                options: DIRECTION_OPTIONS.map(o => ({ ...o, default: o.value === mod.defaultDirection })),
                onChange: notifyChanged
            };
        }
    }

    return entries;
}

export const settings = definePluginSettings({
    respectReducedMotion: {
        type: OptionType.BOOLEAN,
        description: "Disable all animations when your OS 'reduce motion' accessibility setting is on",
        default: true,
        onChange: notifyChanged
    },
    performanceMode: {
        type: OptionType.BOOLEAN,
        description: "Turn off the two heaviest animations (Servers Switch and Channels Switch) if you notice stutter",
        default: false,
        onChange: notifyChanged
    },
    ...buildModuleSettings()
});

export function isModuleEnabled(key: string): boolean {
    if (settings.store.performanceMode && (key === "servers" || key === "channels")) return false;
    return !!settings.store[`${key}_enabled`];
}

export function getModuleStyle(key: string): AnimStyle {
    return (settings.store[`${key}_style`] as AnimStyle) ?? "fade";
}

export function getModuleDuration(key: string): number {
    return settings.store[`${key}_duration`] ?? 200;
}

export function getModuleEasing(key: string): EasingPreset {
    return (settings.store[`${key}_easing`] as EasingPreset) ?? "easeInOutSine";
}

export function getModuleDirection(key: string): Direction {
    return (settings.store[`${key}_direction`] as Direction) ?? "up";
}
