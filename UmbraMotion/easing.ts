/*
 * UmbraMotion, part of Umbraflow
 * Copyright (c) 2026 Big_Killers
 * SPDX-License-Identifier: MIT
 */

// Named easing curves resolved to CSS timing functions. A short curated list
// is easier to pick from than a dropdown of every possible curve.
export const EASING_PRESETS = {
    linear: "linear",

    easeInSine: "cubic-bezier(0.12, 0, 0.39, 0)",
    easeOutSine: "cubic-bezier(0.61, 1, 0.88, 1)",
    easeInOutSine: "cubic-bezier(0.37, 0, 0.63, 1)",

    easeInQuart: "cubic-bezier(0.5, 0, 0.75, 0)",
    easeOutQuart: "cubic-bezier(0.25, 1, 0.5, 1)",
    easeInOutQuart: "cubic-bezier(0.76, 0, 0.24, 1)",

    easeInExpo: "cubic-bezier(0.7, 0, 0.84, 0)",
    easeOutExpo: "cubic-bezier(0.16, 1, 0.3, 1)",
    easeInOutExpo: "cubic-bezier(0.87, 0, 0.13, 1)",

    easeOutBack: "cubic-bezier(0.34, 1.56, 0.64, 1)",
    easeInOutBack: "cubic-bezier(0.68, -0.6, 0.32, 1.6)",

    // Real elastic easing oscillates several times, which a cubic-bezier
    // cannot express. One overshoot is close enough for UI work.
    easeOutElastic: "cubic-bezier(0.68, -0.85, 0.27, 1.85)",

    steps5: "steps(5, end)",
    steps10: "steps(10, end)"
} as const;

export type EasingPreset = keyof typeof EASING_PRESETS;

export const EASING_OPTIONS: { label: string; value: EasingPreset; }[] = [
    { label: "Linear", value: "linear" },
    { label: "Sine — In", value: "easeInSine" },
    { label: "Sine — Out", value: "easeOutSine" },
    { label: "Sine — In/Out (smooth)", value: "easeInOutSine" },
    { label: "Quart — In", value: "easeInQuart" },
    { label: "Quart — Out", value: "easeOutQuart" },
    { label: "Quart — In/Out (snappy)", value: "easeInOutQuart" },
    { label: "Expo — In", value: "easeInExpo" },
    { label: "Expo — Out", value: "easeOutExpo" },
    { label: "Expo — In/Out (very snappy)", value: "easeInOutExpo" },
    { label: "Back — Out (slight overshoot)", value: "easeOutBack" },
    { label: "Back — In/Out", value: "easeInOutBack" },
    { label: "Elastic — Out (springy)", value: "easeOutElastic" },
    { label: "Steps — 5", value: "steps5" },
    { label: "Steps — 10", value: "steps10" }
];

export function resolveEasing(preset: EasingPreset): string {
    return EASING_PRESETS[preset] ?? EASING_PRESETS.easeInOutSine;
}
