# Umbraflow

A dark theme for Discord and Garry's Mod, based on the Windows 11 Fluent look. Made from scratch.

| Platform | What it themes |
|----------|----------------|
| Discord | The whole client: chat, member list, panels, menus, and settings. One file that auto-switches between Light, Dark, and Onyx. |
| Garry's Mod | Main menu, loading screen, VGUI scheme (console, dialogs, spawnmenu), and custom logos. |

---

## Features

- Windows 11 Fluent styling: acrylic-style surfaces, rounded corners, and soft shadows.
- The Discord theme changes itself to match your Discord appearance (Light, Dark, or Onyx). You don't toggle anything.
- Discord and Garry's Mod share the same look.
- The Discord theme is a single file with everything inlined, so there are no extra assets to install.

---

## Screenshots

<!-- Drop your screenshots in a /screenshots folder and link them here -->

| Discord | Garry's Mod |
|---------|-------------|
| ![Discord preview](screenshots/discord.png) | ![Gmod preview](screenshots/gmod.png) |

---

## Discord

`Discord-Themes/umbraflow.css` holds three palettes and picks one automatically based on your Discord appearance:

| Discord appearance | Palette |
|--------------------|---------|
| Light | Clean off-white with silvery cards |
| Dark  | Fluent dark (the default) |
| Onyx  | Near-black, OLED-friendly |

### Install

Download `Discord-Themes/umbraflow.css` from this repo (or the [Releases](../../releases) page), then pick your client mod:

<details open>
<summary><strong>Vencord</strong></summary>

1. Install [Vencord](https://vencord.dev/).
2. Discord → **Settings** → **Vencord → Themes** → **Open Themes Folder**.
3. Drop `umbraflow.css` into that folder.
4. Enable **Umbraflow** in the Themes list.

If you want it to update itself, skip the download and add this under **Themes → Online Themes** instead:
```
https://raw.githubusercontent.com/BigKillers/Umbraflow/main/Discord-Themes/umbraflow.css
```
</details>

<details>
<summary><strong>Equicord</strong> (Vencord fork)</summary>

Same as Vencord: **Settings → Equicord → Themes → Open Themes Folder**, drop the file in, enable it.
</details>

<details>
<summary><strong>BetterDiscord</strong></summary>

1. Install [BetterDiscord](https://betterdiscord.app/).
2. Discord → **Settings** → **Themes** → **Open Themes Folder**.
3. Drop `umbraflow.css` into that folder.
4. Toggle **Umbraflow** on in the Themes list.

The file has the metadata header BetterDiscord needs, so it shows up with its name and author.
</details>

> If it doesn't show up, reload Discord with **`Ctrl`/`Cmd` + R**, or toggle it off and on.

### Choosing the look

Go to **Settings → Appearance → Theme** and pick Light, Dark, or Onyx. Switch whenever you want and the palette changes right away. There's no separate Umbraflow setting.

### How the auto-switch works

Discord puts a class on the app for the current appearance (`theme-light`, `theme-dark`, or `theme-dark theme-midnight` for Onyx). Umbraflow ships all three palettes as CSS variables. Dark is the baseline, and two override blocks (`1b. THEME OVERRIDES`, at the bottom of the file) change only what's different for Light and Onyx. The layout is written once and shared by all three.

---

## Garry's Mod

The `Gmod-Theme/` folder mirrors your `garrysmod` directory. It has the main menu, loading screen, VGUI scheme (`resource/SourceScheme.res`), and custom logos.

### Install

**Back up your `garrysmod` folder first.** This replaces core menu files.

1. Open your GMod install, for example `...\Steam\steamapps\common\GarrysMod\garrysmod\`.
2. Copy the contents of `Gmod-Theme/` into that `garrysmod\` folder, merging and overwriting when asked. The `html/`, `resource/`, and `gamemodes/` folders each land in their matching folder.
3. Restart Garry's Mod.

To undo it, restore your backup or verify the game files through Steam.

---

## Customization

The Discord colors are all CSS variables. The Dark palette is the `:root` block near the top of `umbraflow.css`. Light and Onyx are the two blocks under `1b. THEME OVERRIDES` at the bottom, and each one only lists what's different. Edit a value and reload. The layout rules read the variables, so one change applies to all three palettes.

---

## Community

Questions, updates, or want to show off your setup? Come hang out:

**[discord.gg/4UVrZtkyYs](https://discord.gg/4UVrZtkyYs)**

---

## Issues and contributions

Found a bug or have an idea? Open an [issue](../../issues). Pull requests are welcome, just keep things consistent with the Fluent look.

---

## License

Umbraflow is under the [MIT License](LICENSE). Use it, change it, and share it, just keep the attribution.

---

## Credits

Created by BigKillers (Discord: `Big_Killers`). Fluent design language from Microsoft / Windows 11. Discord Spotify glyph from [Simple Icons](https://simpleicons.org) (CC0).

Not affiliated with Discord, Microsoft, or Facepunch Studios.
