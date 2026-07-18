///////////////////////////////////////////////////////////
// UMBRAFLOW — Fluent-inspired Garry's Mod menu theme.
// Created by Big_Killers · v1.0.0 · © Big_Killers. All rights reserved.
//
// Fluent — VGUI scheme (console, dialogs, spawnmenu, options)
//
// VGUI cannot blur, round corners or animate, so Fluent is carried here by the
// three things it *does* support exactly: the Windows 11 dark neutral ramp,
// the real system fonts (Segoe UI for chrome, Cascadia Mono for the console),
// and per-side borders — which is how the Fluent "control elevation" edge
// (a brighter stroke along the bottom of every control) is reproduced.
//
// To reskin: change only the ACCENT block in Colors. Everything below refers
// to it by name.
///////////////////////////////////////////////////////////
Scheme
{
	//////////////////////// COLORS ///////////////////////////
	Colors
	{
		// ---- ACCENT — Umbraflow violet. Fluent green alternative in comments.
		"Accent"				"177 140 255 255"	// green: "108 203 95 255"
		"AccentHover"			"162 116 255 255"	// green: "87 194 74 255"
		"AccentPressed"			"139 87 230 255"	// green: "76 175 67 255"
		"AccentText"			"216 196 255 255"	// green: "167 229 157 255"
		"AccentSubtle"			"177 140 255 45"		// list selection tint
		"AccentSubtleFaint"		"177 140 255 26"		// selection, unfocused
		"OnAccent"				"0 0 0 255"			// text drawn on an accent fill
		"OnAccentPressed"		"0 0 0 140"			// Fluent dims the label on press

		// ---- Surfaces (the Windows 11 dark neutral ramp)
		"SurfaceBase"			"32 32 32 255"		// #202020 window body
		"SurfaceBaseMica"		"32 32 32 255"		// window body, opaque (no translucency)
		"SurfaceAlt"			"27 27 27 255"		// #1B1B1B inset / console log
		"SurfaceLayer"			"40 40 40 255"		// #282828
		"SurfaceCard"			"43 43 43 255"		// #2B2B2B
		"SurfaceFlyout"			"44 44 44 255"		// #2C2C2C menus, tooltips

		// ---- Control fills
		"Control"				"45 45 45 255"		// #2D2D2D rest
		"ControlHover"			"50 50 50 255"		// #323232
		"ControlPressed"		"40 40 40 255"		// #282828
		"ControlDisabled"		"42 42 42 255"
		"SubtleHover"			"56 56 56 255"		// borderless rows / menu items
		"SubtlePressed"			"47 47 47 255"

		// ---- Strokes
		"Stroke"				"56 56 56 255"		// #383838
		"StrokeStrong"			"69 69 69 255"		// #454545 the bottom edge
		"Divider"				"51 51 51 255"

		// ---- Text
		"TextPrimary"			"255 255 255 255"
		"TextSecondary"			"197 197 197 255"	// #C5C5C5
		"TextTertiary"			"139 139 139 255"
		"TextDisabled"			"93 93 93 255"

		// ---- Semantic
		"Critical"				"255 153 164 255"	// #FF99A4 critical *text*
		"CriticalFill"			"196 43 28 255"		// #C42B1C critical *fill*
		"Success"				"108 203 95 255"

		// ---- Utility
		"White"					"255 255 255 255"
		"Black"					"0 0 0 255"
		"Blank"					"0 0 0 0"
		"Scrim"					"0 0 0 92"
		"ScrollThumb"			"106 106 106 255"
		"ScrollTrack"			"31 31 31 255"

		// Names the engine's own .res files look up by hand — keep them defined
		// even though nothing in this scheme references them.
		"TransparentBlack"		"0 0 0 128"
		"BGOpaque"				"32 32 32 255"
		"BGTransparent"			"32 32 32 0"
		"WhiteTransparent"		"255 255 255 0"
	}

	///////////////////// BASE SETTINGS ////////////////////////
	BaseSettings
	{
		// Fluent's control elevation: the lit edge sits along the BOTTOM of a
		// control in dark theme, not the top.
		Border.Bright					"StrokeStrong"
		Border.Dark						"Stroke"
		Border.Selection				"Accent"
		Border.DarkSolid				"Stroke"
		Border.Subtle					"Stroke"

		// Standard button — a subtle fill that lightens on hover. The accent is
		// reserved for the one primary action in a view, so it is NOT used here.
		Button.TextColor				"TextPrimary"
		Button.BgColor					"Control"
		Button.ArmedTextColor			"TextPrimary"
		Button.ArmedBgColor				"ControlHover"
		Button.DepressedTextColor		"TextSecondary"
		Button.DepressedBgColor			"ControlPressed"
		Button.FocusBorderColor			"Accent"

		CheckButton.TextColor			"TextPrimary"
		CheckButton.SelectedTextColor	"TextPrimary"
		CheckButton.BgColor				"Control"
		CheckButton.Border1				"StrokeStrong"
		CheckButton.Border2				"StrokeStrong"
		CheckButton.Check				"Accent"
		CheckButton.DisabledFgColor		"TextDisabled"
		CheckButton.HighlightFgColor	"AccentSubtle"
		CheckButton.ArmedBgColor		"ControlHover"
		CheckButton.DepressedBgColor	"ControlPressed"
		CheckButton.DisabledBgColor		"ControlDisabled"

		ComboBoxButton.ArrowColor		"TextSecondary"
		ComboBoxButton.ArmedArrowColor	"TextPrimary"
		ComboBoxButton.BgColor			"Control"
		ComboBoxButton.DisabledBgColor	"ControlDisabled"

		Frame.TitleTextInsetX			16
		Frame.ClientInsetX				8
		Frame.ClientInsetY				6
		Frame.BgColor					"SurfaceBaseMica"
		Frame.OutOfFocusBgColor			"28 28 28 255"
		Frame.FocusTransitionEffectTime	"0.15"
		Frame.TransitionEffectTime		"0.15"
		Frame.AutoSnapRange				"0"
		FrameGrip.Color1				"Stroke"
		FrameGrip.Color2				"SurfaceBase"
		FrameTitleButton.FgColor		"TextSecondary"
		FrameTitleButton.BgColor		"Blank"
		FrameTitleButton.DisabledFgColor	"TextDisabled"
		FrameTitleButton.DisabledBgColor	"Blank"
		FrameSystemButton.FgColor		"Blank"
		FrameSystemButton.BgColor		"Blank"
		FrameSystemButton.Icon			""
		FrameSystemButton.DisabledIcon	""
		// Fluent title bars are quiet: plain text, not accent-coloured.
		FrameTitleBar.Font				"UiBold"
		FrameTitleBar.TextColor			"TextPrimary"
		FrameTitleBar.BgColor			"Blank"
		FrameTitleBar.DisabledTextColor	"TextDisabled"
		FrameTitleBar.DisabledBgColor	"Blank"

		GraphPanel.FgColor				"Accent"
		GraphPanel.BgColor				"SurfaceAlt"

		Label.TextDullColor				"TextTertiary"
		Label.TextColor					"TextSecondary"
		Label.TextBrightColor			"TextPrimary"
		Label.SelectedTextColor			"TextPrimary"
		Label.BgColor					"Blank"
		Label.DisabledFgColor1			"TextDisabled"
		Label.DisabledFgColor2			"SurfaceBase"

		// Lists select with an accent *tint*, never a solid accent slab —
		// this is the single biggest tell between Fluent and the old chrome.
		ListPanel.TextColor					"TextSecondary"
		ListPanel.TextBgColor				"Blank"
		ListPanel.BgColor					"SurfaceAlt"
		ListPanel.SelectedTextColor			"TextPrimary"
		ListPanel.SelectedBgColor			"AccentSubtle"
		ListPanel.OutOfFocusSelectedTextColor	"TextSecondary"
		ListPanel.SelectedOutOfFocusBgColor	"AccentSubtleFaint"
		ListPanel.EmptyListInfoTextColor	"TextTertiary"

		// MenuFlyout: subtle fill on hover, not an accent bar.
		Menu.TextColor					"TextSecondary"
		Menu.BgColor					"SurfaceFlyout"
		Menu.ArmedTextColor				"TextPrimary"
		Menu.ArmedBgColor				"SubtleHover"
		Menu.TextInset					"8"

		Panel.FgColor					"TextSecondary"
		Panel.BgColor					"Blank"

		ProgressBar.FgColor				"Accent"
		ProgressBar.BgColor				"Divider"

		PropertySheet.TextColor				"TextTertiary"
		PropertySheet.SelectedTextColor		"TextPrimary"
		PropertySheet.SelectedBgColor		"SurfaceCard"
		PropertySheet.TransitionEffectTime	"0.15"
		PropertySheet.BgColor				"SurfaceBase"

		RadioButton.TextColor			"TextSecondary"
		RadioButton.SelectedTextColor	"TextPrimary"

		RichText.TextColor				"TextSecondary"
		RichText.BgColor				"SurfaceAlt"
		RichText.SelectedTextColor		"TextPrimary"
		RichText.SelectedBgColor		"AccentSubtle"

		// Windows 11 scrollbars are thin.
		ScrollBar.Wide					12

		ScrollBarButton.FgColor				"TextTertiary"
		ScrollBarButton.BgColor				"ScrollTrack"
		ScrollBarButton.ArmedFgColor		"TextPrimary"
		ScrollBarButton.ArmedBgColor		"SubtleHover"
		ScrollBarButton.DepressedFgColor	"TextPrimary"
		ScrollBarButton.DepressedBgColor	"SubtlePressed"

		ScrollBarSlider.FgColor				"ScrollThumb"
		ScrollBarSlider.BgColor				"ScrollTrack"

		SectionedListPanel.HeaderTextColor	"TextTertiary"
		SectionedListPanel.HeaderBgColor	"Blank"
		SectionedListPanel.DividerColor		"Divider"
		SectionedListPanel.TextColor		"TextSecondary"
		SectionedListPanel.BrightTextColor	"TextPrimary"
		SectionedListPanel.BgColor			"SurfaceAlt"
		SectionedListPanel.SelectedTextColor			"TextPrimary"
		SectionedListPanel.SelectedBgColor				"AccentSubtle"
		SectionedListPanel.OutOfFocusSelectedTextColor	"TextSecondary"
		SectionedListPanel.OutOfFocusSelectedBgColor	"AccentSubtleFaint"

		// Fluent slider: accent thumb on a neutral track.
		Slider.NobColor				"Accent"
		Slider.TextColor			"TextSecondary"
		Slider.TrackColor			"SubtleHover"
		Slider.DisabledTextColor1	"TextDisabled"
		Slider.DisabledTextColor2	"SurfaceBase"

		// TextBox: accent focus edge is the Fluent underline, as close as VGUI gets.
		TextEntry.TextColor			"TextPrimary"
		TextEntry.BgColor			"Control"
		TextEntry.CursorColor		"TextPrimary"
		TextEntry.DisabledTextColor	"TextDisabled"
		TextEntry.DisabledBgColor	"ControlDisabled"
		TextEntry.SelectedTextColor	"TextPrimary"
		TextEntry.SelectedBgColor	"AccentSubtle"
		TextEntry.OutOfFocusSelectedBgColor	"AccentSubtleFaint"
		TextEntry.FocusEdgeColor	"Accent"

		ToggleButton.SelectedTextColor	"AccentText"

		// Fluent tooltips are a dark surface with light text — not an accent chip.
		Tooltip.TextColor			"TextPrimary"
		Tooltip.BgColor				"SurfaceFlyout"

		TreeView.BgColor			"Blank"

		WizardSubPanel.BgColor		"Blank"

		// scheme-specific colors
		MainMenu.TextColor			"TextSecondary"
		MainMenu.ArmedTextColor		"TextPrimary"
		MainMenu.DepressedTextColor	"AccentText"
		MainMenu.MenuItemHeight		"30"
		MainMenu.Inset				"32"
		MainMenu.Backdrop			"0 0 0 140"

		// The console. DevTextColor is what tints developer/echo lines — in
		// Fluent that reads as accent text rather than terminal green.
		Console.TextColor			"TextSecondary"
		Console.DevTextColor		"AccentText"

		NewGame.TextColor			"TextSecondary"
		NewGame.FillColor			"SurfaceBase"
		NewGame.SelectionColor		"Accent"
		NewGame.DisabledColor		"TextDisabled"

		MessageDialog.MatchmakingBG				"SurfaceBase"
		MessageDialog.MatchmakingBGBlack		"SurfaceAlt"

		MatchmakingMenuItemTitleColor		"TextPrimary"
		MatchmakingMenuItemDescriptionColor	"TextSecondary"

		"QuickListBGDeselected"		"Control"
		"QuickListBGSelected"		"AccentSubtle"
	}

	//////////////////////// BITMAP FONT FILES /////////////////////////////
	//
	// Bitmap Fonts are ****VERY*** expensive static memory resources so they are purposely sparse
	BitmapFontFiles
	{
		// UI buttons, custom font, (256x64)
		"Buttons"		"materials/vgui/fonts/buttons_32.vbf"
	}

	//////////////////////// FONTS /////////////////////////////
	//
	// Chrome fonts are Segoe UI; fixed-width fonts are Cascadia Mono falling
	// back to Consolas. "Segoe UI" (static) is used rather than "Segoe UI
	// Variable" because VGUI resolves fonts through GDI and cannot address a
	// variable font's weight axis — the static family is visually identical at
	// UI sizes and is guaranteed present on every Windows install.
	//
	// Gameplay HUD fonts (HUDNumber*, Trebuchet*, TitleFont) are deliberately
	// left alone: restyling those changes the game, not the chrome.
	Fonts
	{
		// ---- Fixed width / console -------------------------------------
		"DebugFixed"
		{
			"1"
			{
				"name"		"Cascadia Mono" [$WINDOWS]
				"name"		"DejaVu Sans Mono" [!$WINDOWS]
				"tall"		"11"
				"weight"	"400"
				"antialias" "1"
			}
			"2"
			{
				"name"		"Consolas" [$WINDOWS]
				"name"		"Courier New" [!$WINDOWS]
				"tall"		"11"
				"weight"	"400"
				"antialias" "1"
			}
		}
		"DebugFixedSmall"
		{
			"1"
			{
				"name"		"Cascadia Mono" [$WINDOWS]
				"name"		"DejaVu Sans Mono" [!$WINDOWS]
				"tall"		"8"
				"weight"	"400"
				"antialias" "1"
			}
			"2"
			{
				"name"		"Consolas" [$WINDOWS]
				"name"		"Courier New" [!$WINDOWS]
				"tall"		"8"
				"weight"	"400"
				"antialias" "1"
			}
		}
		"DefaultFixedOutline"
		{
			"1"
			{
				"name"		"Cascadia Mono" [$WINDOWS]
				"name"		"DejaVu Sans Mono" [!$WINDOWS]
				"tall"		"14" [$LINUX]
				"tall"		 "11"
				"tall_lodef" "15"
				"tall_hidef" "20"
				"weight"	 "400"
				"outline"	 "1"
			}
			"2"
			{
				"name"		"Consolas" [$WINDOWS]
				"name"		"Courier New" [!$WINDOWS]
				"tall"		 "11"
				"weight"	 "400"
				"outline"	 "1"
			}
		}

		// ---- Chrome ------------------------------------------------------
		"Default"
		{
			"1"
			{
				"name"		"Segoe UI" [$WINDOWS]
				"name"		"Verdana" [!$WINDOWS]
				"tall"		"16"
				"weight"	"400"
				"antialias"	"1"
			}
		}
		"DefaultBold"
		{
			"1"
			{
				"name"		"Segoe UI Semibold" [$WINDOWS]
				"name"		"Verdana" [!$WINDOWS]
				"tall"		"16"
				"weight"	"600"
				"antialias"	"1"
			}
			"2"
			{
				"name"		"Segoe UI" [$WINDOWS]
				"name"		"Verdana" [!$WINDOWS]
				"tall"		"16"
				"weight"	"700"
				"antialias"	"1"
			}
		}
		"DefaultUnderline"
		{
			"1"
			{
				"name"		"Segoe UI" [$WINDOWS]
				"name"		"Verdana" [!$WINDOWS]
				"tall"		"16"
				"weight"	"400"
				"underline" "1"
				"antialias"	"1"
			}
		}
		"DefaultSmall"
		{
			"1"
			{
				"name"		"Segoe UI" [$WINDOWS]
				"name"		"Verdana" [!$WINDOWS]
				"tall"		"13" [$WINDOWS]
				"tall"		"14" [$OSX]
				"tall"		"16" [$LINUX]
				"weight"	"400"
				"antialias"	"1"
			}
		}
		"DefaultSmallDropShadow"
		{
			"1"
			{
				"name"		"Segoe UI" [$WINDOWS]
				"name"		"Verdana" [!$WINDOWS]
				"tall"		"14"
				"weight"	"400"
				"dropshadow" "1"
				"antialias"	"1"
			}
		}
		"DefaultVerySmall"
		{
			"1"
			{
				"name"		"Segoe UI" [$WINDOWS]
				"name"		"Verdana" [!$WINDOWS]
				"tall"		"12"
				"weight"	"400"
				"antialias"	"1"
			}
		}

		"DefaultLarge"
		{
			"1"
			{
				"name"		"Segoe UI" [$WINDOWS]
				"name"		"Verdana" [!$WINDOWS]
				"tall"		"20"
				"weight"	"400"
				"antialias"	"1"
			}
		}
		"UiBold"
		{
			"1"	[$WIN32]
			{
				"name"		"Segoe UI Semibold" [$WINDOWS]
				"name"		"Verdana" [!$WINDOWS]
				"tall"		"14"
				"weight"	"600"
				"antialias"	"1"
			}
			"2"	[$WIN32]
			{
				"name"		"Segoe UI" [$WINDOWS]
				"name"		"Verdana" [!$WINDOWS]
				"tall"		"14"
				"weight"	"700"
				"antialias"	"1"
			}
			"1"	[$X360]
			{
				"name"		"Tahoma"
				"tall"		"24"
				"weight"	"2000"
				"outline"	"1"
			}
		}
		"ChapterTitle"	[$X360]
		{
			"1"
			{
				"name"			"Tahoma"
				"tall"			"20"
				"tall_hidef"	"28"
				"weight"		"2000"
				"outline"		"1"
			}
		}
		"ChapterTitleBlur"	[$X360]
		{
			"1"
			{
				"name"			"Tahoma"
				"tall"			"20"
				"tall_hidef"	"28"
				"weight"		"2000"
				"blur"			"3"
				"blur_hidef"	"5"
			}
		}
		"MenuLarge"
		{
			"1"	[$LINUX]
			{
				"name"		"Helvetica Bold"
				"tall"		"20"
				"antialias" "1"
			}
			"1"	[!$LINUX]
			{
				"name"		"Segoe UI Semibold" [$WINDOWS]
				"name"		"Verdana" [!$WINDOWS]
				"tall"		"18"
				"weight"	"600"
				"antialias" "1"
			}
			"1"	[$X360]
			{
				"name"		"Verdana"
				"tall"			"14"
				"tall_hidef"	"20"
				"weight"	"1200"
				"antialias" "1"
				"outline" "1"
			}
		}
		"AchievementTitleFont"
		{
			"1"
			{
				"name"		"Segoe UI Semibold" [$WINDOWS]
				"name"		"Verdana" [!$WINDOWS]
				"tall"		"20"
				"weight"	"600"
				"antialias" "1"
				"outline" "1"
			}
		}

		"AchievementTitleFontSmaller"
		{
			"1"
			{
				"name"		"Segoe UI Semibold" [$WINDOWS]
				"name"		"Verdana" [!$WINDOWS]
				"tall"		"18"
				"weight"	"600"
				"antialias" "1"
			}
		}


		"AchievementDescriptionFont"
		{
			"1"
			{
				"name"		"Segoe UI" [$WINDOWS]
				"name"		"Verdana" [!$WINDOWS]
				"tall"		"15"
				"weight"	"400"
				"antialias" "1"
				"outline" "1"
				"yres"		"0 480"
			}
			"2"
			{
				"name"		"Segoe UI" [$WINDOWS]
				"name"		"Verdana" [!$WINDOWS]
				"tall"		"20"
				"weight"	"400"
				"antialias" "1"
				"outline" "1"
				"yres"	 "481 10000"
			}
		}

		GameUIButtons
		{
			"1"	[$X360]
			{
				"bitmap"	"1"
				"name"		"Buttons"
				"scalex"	"0.63"
				"scaley"	"0.63"
				"scalex_hidef"	"1.0"
				"scaley_hidef"	"1.0"
				"scalex_lodef"	"0.75"
				"scaley_lodef"	"0.75"
			}
		}

		// The console log itself. Cascadia Mono ships with Windows 11; if it is
		// missing, entry "2" (Consolas, present on every Windows) takes over.
		"ConsoleText"
		{
			"1"
			{
				"name"		"Cascadia Mono" [$WINDOWS]
				"name"		"DejaVu Sans Mono" [!$WINDOWS]
				"tall"		"13" [$WINDOWS]
				"tall"		"14" [!$WINDOWS]
				"weight"	"400"
				"antialias"	"1"
			}
			"2"
			{
				"name"		"Consolas" [$WINDOWS]
				"name"		"Courier New" [!$WINDOWS]
				"tall"		"13" [$WINDOWS]
				"tall"		"14" [!$WINDOWS]
				"weight"	"400"
				"antialias"	"1"
			}
		}

		// this is the symbol font — VGUI draws checkmarks, carets and close
		// glyphs from it, so it must stay exactly as it is.
		"Marlett"
		{
			"1"
			{
				"name"		"Marlett"
				"tall"		"14"
				"weight"	"0"
				"symbol"	"1"
			}
		}

		// ---- Gameplay HUD fonts — intentionally unchanged ------------------
		"Trebuchet24"
		{
			"1"
			{
				"name"		"Trebuchet MS"
				"tall"		"24"
				"weight"	"900"
			}
		}

		"Trebuchet20"
		{
			"1"
			{
				"name"		"Trebuchet MS"
				"tall"		"20"
				"weight"	"900"
			}
		}

		"Trebuchet18"
		{
			"1"
			{
				"name"		"Trebuchet MS"
				"tall"		"18"
				"weight"	"900"
			}
		}

		// HUD numbers
		// We use multiple fonts to 'pulse' them in the HUD, hence the need for many of near size
		"HUDNumber"
		{
			"1"
			{
				"name"		"Trebuchet MS"
				"tall"		"40"
				"weight"	"900"
			}
		}
		"HUDNumber1"
		{
			"1"
			{
				"name"		"Trebuchet MS"
				"tall"		"41"
				"weight"	"900"
			}
		}
		"HUDNumber2"
		{
			"1"
			{
				"name"		"Trebuchet MS"
				"tall"		"42"
				"weight"	"900"
			}
		}
		"HUDNumber3"
		{
			"1"
			{
				"name"		"Trebuchet MS"
				"tall"		"43"
				"weight"	"900"
			}
		}
		"HUDNumber4"
		{
			"1"
			{
				"name"		"Trebuchet MS"
				"tall"		"44"
				"weight"	"900"
			}
		}
		"HUDNumber5"
		{
			"1"
			{
				"name"		"Trebuchet MS"
				"tall"		"45"
				"weight"	"900"
			}
		}

		"DefaultFixed"
		{
			"1"
			{
				"name"		 "Cascadia Mono" [$WINDOWS]
				"name"		 "Cascadia Mono" [$X360]
				"name"		 "DejaVu Sans Mono" [$LINUX]
				"tall"		"12" [$LINUX]
				"tall"		"11"
				"weight"	"400"
				"antialias"	"1"
			}
			"2"
			{
				"name"		 "Consolas" [$WINDOWS]
				"name"		 "Courier New" [!$WINDOWS]
				"tall"		"11"
				"weight"	"400"
				"antialias"	"1"
			}
		}

		"DefaultFixedDropShadow"
		{
			"1"
			{
				"name"		 "Cascadia Mono" [$WINDOWS]
				"name"		 "Cascadia Mono" [$X360]
				"name"		 "Cascadia Mono" [$OSX]
				"name"		 "DejaVu Sans Mono" [$LINUX]
				"tall"		"14" [$LINUX]
				"tall"		"11"
				"weight"	"400"
				"dropshadow" "1"
				"antialias"	"1"
			}
			"2"
			{
				"name"		 "Consolas" [$WINDOWS]
				"name"		 "Courier" [!$WINDOWS]
				"tall"		"11"
				"weight"	"400"
				"dropshadow" "1"
				"antialias"	"1"
			}
		}

		"CloseCaption_Normal"
		{
			"1"
			{
				"name"		"Segoe UI" [!$POSIX]
				"name"		"Verdana" [$POSIX]
				"tall"		"16"
				"weight"	"400"
				"antialias"	"1"
			}
		}
		"CloseCaption_Italic"
		{
			"1"
			{
				"name"		"Segoe UI" [!$POSIX]
				"name"		"Verdana" [$POSIX]
				"tall"		"16"
				"weight"	"400"
				"italic"	"1"
				"antialias"	"1"
			}
		}
		"CloseCaption_Bold"
		{
			"1"
			{
				"name"		"Segoe UI Semibold" [!$POSIX]
				"name"		"Verdana Bold" [$POSIX]
				"tall"		"16"
				"weight"	"600"
				"antialias"	"1"
			}
		}
		"CloseCaption_BoldItalic"
		{
			"1"
			{
				"name"		"Segoe UI Semibold" [!$POSIX]
				"name"		"Verdana Bold Italic" [$POSIX]
				"tall"		"16"
				"weight"	"600"
				"italic"	"1"
				"antialias"	"1"
			}
		}

		TitleFont
		{
			"1"
			{
				"name"		"HalfLife2"
				"tall"		"72"
				"weight"	"400"
				"antialias"	"1"
				"custom"	"1"
			}
		}

		TitleFont2
		{
			"1"
			{
				"name"		"HalfLife2"
				"tall"		"120"
				"weight"	"400"
				"antialias"	"1"
				"custom"	"1"
			}
		}

		AppchooserGameTitleFont	[$X360]
		{
			"1"
			{
				"name"			"Trebuchet MS"
				"tall"			"16"
				"tall_hidef"	"24"
				"weight"		"900"
				"antialias"		"1"
			}
		}

		AppchooserGameTitleFontBlur	[$X360]
		{
			"1"
			{
				"name"			"Trebuchet MS"
				"tall"			"16"
				"tall_hidef"	"24"
				"weight"		"900"
				"blur"			"3"
				"blur_hidef"	"5"
				"antialias"		"1"
			}
		}

		StatsTitle	[$WIN32]
		{
			"1"
			{
				"name"		"Segoe UI Semibold" [!$POSIX]
				"name"		"Verdana Bold" [$POSIX]
				"weight"		"600"
				"tall"			"20"
				"antialias"		"1"
			}
		}

		StatsText	[$WIN32]
		{
			"1"
			{
				"name"		"Segoe UI" [!$POSIX]
				"name"		"Verdana Bold" [$POSIX]
				"weight"		"400"
				"tall"			"18"
				"antialias"		"1"
			}
		}

		AchievementItemTitle	[$WIN32]
		{
			"1"
			{
				"name"		"Segoe UI Semibold" [!$POSIX]
				"name"		"Verdana Bold" [$POSIX]
				"weight"		"600"
				"tall"			"16" [!$POSIX]
				"tall"			"18" [$POSIX]
				"antialias"		"1"
			}
		}

		AchievementItemDate	[$WIN32]
		{
			"1"
			{
				"name"		"Segoe UI" [!$POSIX]
				"name"		"Verdana Bold" [$POSIX]
				"weight"		"400"
				"tall"			"16"
				"antialias"		"1"
			}
		}


		StatsPageText
		{
			"1"
			{
				"name"		"Segoe UI" [!$POSIX]
				"name"		"Verdana Bold" [$POSIX]
				"weight"		"400"
				"tall"			"14" [!$POSIX]
				"tall"			"16" [$POSIX]
				"antialias"		"1"
			}
		}

		AchievementItemTitleLarge	[$WIN32]
		{
			"1"
			{
				"name"		"Segoe UI Semibold" [!$POSIX]
				"name"		"Verdana Bold" [$POSIX]
				"weight"		"600"
				"tall"			"18" [!$POSIX]
				"tall"			"19" [$POSIX]
				"antialias"		"1"
			}
		}

		AchievementItemDescription	[$WIN32]
		{
			"1"
			{
				"name"		"Segoe UI" [!$POSIX]
				"name"		"Verdana" [$POSIX]
				"weight"		"400"
				"tall"			"14" [!$POSIX]
				"tall"			"15" [$POSIX]
				"antialias"		"1"
			}
		}


		"ServerBrowserTitle"
		{
			"1"
			{
				"name"		"Segoe UI Semibold" [!$POSIX]
				"name"		"Verdana" [$POSIX]
				"tall"		"32"
				"tall_lodef"	"40"
				"weight"	"600"
				"additive"	"0"
				"antialias" "1"
			}
		}

		"ServerBrowserSmall"
		{
			"1"
			{
				"name"		"Segoe UI"
				"tall"		"16"
				"weight"	"400"
				"range"		"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"yres"	"480 599"
				"antialias"	"1"
			}
			"2"
			{
				"name"		"Segoe UI"
				"tall"		"16"
				"weight"	"400"
				"range"		"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"yres"	"600 767"
				"antialias"	"1"
			}
			"3"
			{
				"name"		"Segoe UI"
				"tall"		"16"
				"weight"	"400"
				"range"		"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"yres"	"768 1023"
				"antialias"	"1"
			}
			"4"
			{
				"name"		"Segoe UI"
				"tall"		"19"
				"weight"	"400"
				"range"		"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"yres"	"1024 1199"
				"antialias"	"1"
			}
			"5"
			{
				"name"		"Segoe UI"
				"tall"		"19"
				"weight"	"400"
				"range"		"0x0000 0x017F" //	Basic Latin, Latin-1 Supplement, Latin Extended-A
				"yres"	"1200 6000"
				"antialias"	"1"
			}
		}

	}

	//
	//////////////////// BORDERS //////////////////////////////
	//
	// VGUI cannot round a corner, so the Fluent edge language is carried
	// entirely by stroke colour and which side it lands on.
	//
	Borders
	{
		BaseBorder		SubtleBorder
		ButtonBorder	RaisedBorder
		ComboBoxBorder	RaisedBorder
		MenuBorder		FlyoutBorder
		BrowserBorder	DepressedBorder
		PropertySheetBorder	SubtleBorder

		FrameBorder
		{
			Left
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Right
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}
		}

		SubtleBorder
		{
			"inset" "0 0 0 0"
			Left
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Right
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}
		}

		// Menus and tooltips sit above the page, so their edge is darker than
		// the surface they cover — the same relationship Fluent's flyout stroke
		// has to the acrylic behind it.
		FlyoutBorder
		{
			"inset" "0 0 0 0"
			Left
			{
				"1"
				{
					"color" "Divider"
					"offset" "0 0"
				}
			}

			Right
			{
				"1"
				{
					"color" "Divider"
					"offset" "0 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Divider"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Divider"
					"offset" "0 0"
				}
			}
		}

		DepressedBorder
		{
			"inset" "0 0 0 0"
			Left
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Right
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}
		}

		// THE Fluent control edge: three sides at the default stroke, and a
		// brighter stroke along the bottom. In dark theme the lit edge is below,
		// which is what makes a WinUI button read as raised.
		RaisedBorder
		{
			"inset" "0 0 0 0"
			Left
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Right
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "StrokeStrong"
					"offset" "0 0"
				}
			}
		}

		TitleButtonBorder
		{
			"backgroundtype" "0"
		}

		TitleButtonDisabledBorder
		{
			"backgroundtype" "0"
		}

		TitleButtonDepressedBorder
		{
			"backgroundtype" "0"
		}

		ScrollBarButtonBorder
		{
			"inset" "0 0 0 0"
			Left
			{
				"1"
				{
					"color" "ScrollTrack"
					"offset" "0 0"
				}
			}

			Right
			{
				"1"
				{
					"color" "ScrollTrack"
					"offset" "0 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "ScrollTrack"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "ScrollTrack"
					"offset" "0 0"
				}
			}
		}

		ScrollBarButtonDepressedBorder
		{
			"inset" "0 0 0 0"
			Left
			{
				"1"
				{
					"color" "ScrollTrack"
					"offset" "0 0"
				}
			}

			Right
			{
				"1"
				{
					"color" "ScrollTrack"
					"offset" "0 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "ScrollTrack"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "ScrollTrack"
					"offset" "0 0"
				}
			}
		}

		TabBorder
		{
			"inset" "1 1 1 1"
			Left
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Right
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}
		}

		// The active tab gets an accent edge along its top — VGUI's nearest
		// equivalent to the Fluent TabView selection indicator.
		TabActiveBorder
		{
			"inset" "1 1 1 1"
			Left
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Accent"
					"offset" "0 0"
				}
			}

			Right
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

		}


		ToolTipBorder
		{
			"inset" "0 0 1 0"
			Left
			{
				"1"
				{
					"color" "Divider"
					"offset" "0 0"
				}
			}

			Right
			{
				"1"
				{
					"color" "Divider"
					"offset" "0 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Divider"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Divider"
					"offset" "0 0"
				}
			}
		}

		// The focus rectangle — Fluent draws it in the accent colour.
		ButtonKeyFocusBorder
		{
			"inset" "0 0 0 0"
			Left
			{
				"1"
				{
					"color" "Accent"
					"offset" "0 0"
				}
			}
			Top
			{
				"1"
				{
					"color" "Accent"
					"offset" "0 0"
				}
			}
			Right
			{
				"1"
				{
					"color" "Accent"
					"offset" "0 0"
				}
			}
			Bottom
			{
				"1"
				{
					"color" "Accent"
					"offset" "0 0"
				}
			}
		}

		// Pressed: the lit bottom edge goes away, so the control reads as sunk.
		ButtonDepressedBorder
		{
			"inset" "0 0 0 0"
			Left
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Right
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Top
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}

			Bottom
			{
				"1"
				{
					"color" "Stroke"
					"offset" "0 0"
				}
			}
		}
	}

	//////////////////////// CUSTOM FONT FILES /////////////////////////////
	//
	// specifies all the custom (non-system) font files that need to be loaded to service the above described fonts
	CustomFontFiles
	{
		"1"		"resource/HALFLIFE2.ttf"
		"2"		"resource/HL2EP2.ttf"
		"3"		"resource/marlett.ttf"
	}
}
