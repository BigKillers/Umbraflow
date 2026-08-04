# UmbraMotion

A Vencord userplugin by Big_Killers. Adds enter animations across Discord's UI, with per-spot control over style, duration, easing and direction. Part of the [Umbraflow](https://github.com/BigKillers/Umbraflow) family.

## What it does

Thirteen places in Discord get an animation when they appear, and each one can be configured or turned off on its own:

- Page and section swaps: Servers Switch, Channels Switch, Settings Switch, Layers Switch
- Overlays: Tooltips, Popouts, Context Menu, Modals, Modals Backdrop, Members Sidebar, Thread Sidebar
- List rows: Messages, Channel List

There are five animation styles (Fade, Slide, Blur, Scale, Slip), 15 easing curves, and durations from 100ms to 2000ms.

Two global switches: **Respect reduced motion** turns everything off when the OS accessibility setting asks for it, and **Performance mode** kills the two heaviest animations (Servers and Channels Switch) if you notice stutter.

## Install

Userplugins need Vencord built from source. That sounds scarier than it is:

1. Clone and set up [Vencord](https://github.com/Vendicated/Vencord):
   ```bash
   git clone https://github.com/Vendicated/Vencord
   cd Vencord
   pnpm install --frozen-lockfile
   ```
2. Copy this `UmbraMotion` folder into `src/userplugins/` (create the folder if it doesn't exist).
3. Build and inject:
   ```bash
   pnpm build
   pnpm inject
   ```
   Quit Discord fully first (from the tray icon, not just the window).
4. Relaunch Discord and enable **UmbraMotion** under Settings → Vencord → Plugins. The cog icon opens the per-module settings.

To remove it: `pnpm uninject` from the Vencord folder.

After editing any file here: `pnpm build`, then reload Discord with Ctrl+R. No need to inject again.

## Read this before touching exit animations

An early build also animated things on the way *out*, using a MutationObserver that reinserted DOM nodes right as React removed them, held them in place to play an animation, then removed them for real. It broke Discord badly: DMs stopped listing, messages stopped rendering, popouts and settings wouldn't open. The reason is that React removes and replaces nodes constantly as part of normal re-rendering, not just when something closes. Reinserting those nodes fights React's own bookkeeping and desyncs the page.

So this plugin is enter-only, and the exit mechanism was deleted rather than patched. If you ever want exit animations back, they need a design that never reinserts removed nodes, and they should be tested one module at a time.

## How it works

Everything is a single generated stylesheet. Each enabled module contributes one `@keyframes` entry animation that plays once when a matching element mounts. There are no patches into Discord's code and no DOM manipulation at runtime.

Keyframes matter here, not transitions. A `transition` rule would overwrite Discord's own hover transitions on matched elements, and it would linger after entry, so when Discord repositions a tooltip via transform the element would drag behind the cursor. A keyframe animation runs once and gets out of the way. Reduced motion is a media query inside the stylesheet, so flipping the OS setting applies instantly with no JS listener.

## If a module doesn't animate

Discord's class names follow a `word_hash` / `word__hash` pattern and change between updates. Checked against a live client on 2026-08-04:

- Confirmed animating on real elements: Servers Switch, Channels Switch, Layers Switch, Tooltips, Messages, Channel List.
- Not yet confirmed (the element was never on screen during testing, so the selector follows the naming convention but is unproven): Settings Switch, Popouts, Context Menu, Modals, Modals Backdrop, Members Sidebar, Thread Sidebar.

If a module doesn't animate, the selector is the first thing to check: inspect the element in Discord (enable DevTools in Vencord settings), find the real class fragment, and fix the `selector` field for that module in `modules.ts`. All the CSS generation reads from that one file. Then `pnpm build` and reload.
