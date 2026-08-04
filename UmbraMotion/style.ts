/*
 * Vencord, a Discord client mod
 * Copyright (c) 2026 Big_Killers
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

import { resolveEasing } from "./easing";
import { AnimStyle, Direction, MODULES } from "./modules";
import { getModuleDirection, getModuleDuration, getModuleEasing, getModuleStyle, isModuleEnabled, settings } from "./settings";

const SLIDE_DISTANCE = "36px";
const SLIP_DISTANCE = "14px";
const SCALE_FROM = "0.9";
const BLUR_AMOUNT = "10px";

// Entry animations are CSS `animation`s, not `transition` + @starting-style.
// The transition version had two real bugs: the shorthand overwrote
// Discord's own transitions on matched elements (hover fades and the like),
// and it lingered after entry, so when Discord repositioned a tooltip or
// popout via transform, our curve made it visibly drag behind the cursor.
// A keyframe animation plays once on mount and touches nothing else.
function translateFor(direction: Direction, distance: string): string {
    switch (direction) {
        case "down": return `translateY(-${distance})`;
        case "left": return `translateX(${distance})`;
        case "right": return `translateX(-${distance})`;
        case "up":
        default: return `translateY(${distance})`;
    }
}

// Each style only declares the properties it animates, so a fade never
// touches transform or filter.
function keyframeFor(style: AnimStyle, direction: Direction): { name: string; frames: string; } {
    switch (style) {
        case "fade":
            return { name: "vc-um-fade", frames: "from { opacity: 0; }" };
        case "blur":
            return { name: "vc-um-blur", frames: `from { opacity: 0; filter: blur(${BLUR_AMOUNT}); }` };
        case "scale":
            return { name: "vc-um-scale", frames: `from { opacity: 0; transform: scale(${SCALE_FROM}); }` };
        case "slip":
            return {
                name: `vc-um-slip-${direction}`,
                frames: `from { opacity: 0; transform: ${translateFor(direction, SLIP_DISTANCE)}; }`
            };
        case "slide":
        default:
            return {
                name: `vc-um-slide-${direction}`,
                frames: `from { opacity: 0; transform: ${translateFor(direction, SLIDE_DISTANCE)}; }`
            };
    }
}

export function buildStylesheet(): string {
    const keyframes = new Map<string, string>();
    const rules: string[] = [];

    for (const mod of MODULES) {
        if (!isModuleEnabled(mod.key)) continue;

        const { name, frames } = keyframeFor(getModuleStyle(mod.key), getModuleDirection(mod.key));
        keyframes.set(name, frames);

        const duration = Math.round(getModuleDuration(mod.key));
        const easing = resolveEasing(getModuleEasing(mod.key));

        rules.push(`/* ${mod.label} */
${mod.selector} {
    animation: ${name} ${duration}ms ${easing} backwards;
}`);
    }

    if (!rules.length) return "/* UmbraMotion: all modules disabled */";

    const frameDefs = [...keyframes]
        .map(([name, frames]) => `@keyframes ${name} { ${frames} }`)
        .join("\n");
    const body = `${frameDefs}\n\n${rules.join("\n\n")}`;

    // Reduced motion is a media query in the stylesheet itself, so OS-level
    // changes apply live without a JS listener.
    return settings.store.respectReducedMotion
        ? `@media (prefers-reduced-motion: no-preference) {\n${body}\n}`
        : body;
}
