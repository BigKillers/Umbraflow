# Umbraflow

A sleek, dark theme for **Discord** and **Garry's Mod**, built on the Windows 11
**Fluent** design language. Smooth surfaces, subtle depth, and a cohesive look
across both platforms.

> Made from scratch. Inspired by Windows 11 Fluent Design Language.

| Platform | What it themes |
|----------|----------------|
| 🗨️ **Discord** | The whole client — chat, member list, panels, menus, settings. One file that **auto-switches** between Light / Dark / Onyx. |
| 🎮 **Garry's Mod** | Main menu, loading screen, VGUI scheme (console/dialogs/spawnmenu), a Fluent killfeed, and custom logos. |

---

## ✨ Features

- **Fluent-inspired design** — acrylic/mica-style surfaces, rounded corners, and soft shadows drawn from Windows 11.
- **Auto-switching (Discord)** — one file follows your Discord appearance: **Light**, **Dark**, or **Onyx**. No manual toggling.
- **Consistent across platforms** — the same visual identity whether you're chatting or in-game.
- **Lightweight** — the Discord theme is a single file with no external assets; textures and icons are inlined.

---

## 📸 Screenshots

<!-- Drop your screenshots in a /screenshots folder and link them here -->

| Discord | Garry's Mod |
|---------|-------------|
| ![Discord preview](screenshots/discord.png) | ![Gmod preview](screenshots/gmod.png) |

---

## 🗨️ Discord

`Discord-Themes/umbraflow-all.css` holds **three palettes** and switches
automatically to match your Discord appearance:

| Discord appearance | Palette |
|--------------------|---------|
| **Light** | Clean off-white with silvery cards |
| **Dark**  | Fluent dark (the default) |
| **Onyx**  | Near-black, OLED-friendly |

### Install

Download **`Discord-Themes/umbraflow-all.css`** from this repo (or the
[Releases](../../releases) page). Then pick your client mod:

<details open>
<summary><strong>Vencord</strong></summary>

1. Install [Vencord](https://vencord.dev/).
2. Discord → **Settings** → **Vencord → Themes** → **Open Themes Folder**.
3. Drop `umbraflow-all.css` into that folder.
4. Enable **Umbraflow** in the Themes list.

**Auto-updating alternative:** under **Themes → Online Themes**, paste:
```
https://raw.githubusercontent.com/BigKillers/Umbraflow/main/Discord-Themes/umbraflow-all.css
```
</details>

<details>
<summary><strong>Equicord</strong> (Vencord fork)</summary>

Same steps as Vencord — **Settings → Equicord → Themes → Open Themes Folder**,
drop the file in, enable it.
</details>

<details>
<summary><strong>BetterDiscord</strong></summary>

1. Install [BetterDiscord](https://betterdiscord.app/).
2. Discord → **Settings** → **Themes** → **Open Themes Folder**.
3. Drop `umbraflow-all.css` into that folder.
4. Toggle **Umbraflow** on in the Themes list.

The file includes the required metadata header, so it shows with its name and author.
</details>

> If it doesn't appear, reload Discord with **`Ctrl`/`Cmd` + R** or toggle it off and on.

### Choosing the look

**Settings → Appearance → Theme → Light, Dark, or Onyx.** Switch any time and the
palette changes instantly — there's no separate Umbraflow setting.

### How the auto-switch works

Discord tags the app with a class for the current appearance (`theme-light`,
`theme-dark`, or `theme-dark theme-midnight` for Onyx). Umbraflow ships all three
palettes as CSS variables: Dark is the baseline, and two override blocks
(`1b. THEME OVERRIDES`, at the bottom of the file) re-apply only what changes for
Light and Onyx. The layout is written once and shared by all three.

---

## 🎮 Garry's Mod

The `Gmod-Theme/` folder mirrors your `garrysmod` directory and includes the main
menu, loading screen, VGUI scheme (`resource/SourceScheme.res`), a Fluent killfeed
addon (`addons/umbraflow/`), and custom logos.

### Install

> ⚠️ **Back up your `garrysmod` folder first** — this replaces core menu files.

1. Open your GMod install, e.g.
   `…\Steam\steamapps\common\GarrysMod\garrysmod\`
2. Copy the **contents** of `Gmod-Theme/` into that `garrysmod\` folder, merging
   and overwriting when prompted (`html/`, `resource/`, `addons/`, `gamemodes/`,
   and `lua/` each land in their matching folder).
3. Restart Garry's Mod.

To revert, restore your backup or verify the game's files through Steam.

---

## 🎨 Customization

All Discord colors are CSS variables. The **Dark** palette is the `:root` block
near the top of `umbraflow-all.css`; **Light** and **Onyx** are the two blocks
under **`1b. THEME OVERRIDES`** at the bottom, each listing only what differs.
Edit a value and reload — the layout rules read the variables, so one change
applies to all three palettes.

---

## 🐛 Issues & Contributions

Found a bug or have an idea? Open an [issue](../../issues). Pull requests are
welcome — please keep changes consistent with the Fluent aesthetic.

---

## 📄 License

Umbraflow is released under the [MIT License](LICENSE) — free to use, modify, and
share, as long as attribution is kept.

---

## 🙌 Credits

Created by **BigKillers** (Discord: `Big_Killers`). Fluent design language from
Microsoft / Windows 11. Discord Spotify glyph from
[Simple Icons](https://simpleicons.org) (CC0).

*Not affiliated with Discord, Microsoft, or Facepunch Studios.*
