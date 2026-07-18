--[[---------------------------------------------------------------------------
	UMBRAFLOW — Fluent-inspired Garry's Mod theme.
	Created by Big_Killers · v1.0.0 · © Big_Killers. All rights reserved.

	Fluent — the kill feed.

	The rest of this theme reskins chrome through data (SourceScheme.res, CSS).
	The kill feed is not chrome: the base gamemode draws it in Lua, from
	base/gamemode/cl_deathnotice.lua, so nothing declarative can reach it. It is
	replaced here instead — and because both of the base's entry points are
	hook.Run calls ("AddDeathNotice" and "DrawDeathNotice"), the replacement is a
	pair of hooks rather than an overwrite of the gamemode table.

	What Fluent gets us that the stock feed doesn't: each notice is a card on a
	dark acrylic-ish surface with a 1px stroke, names use the scheme's text ramp
	instead of raw team colours, and rows involving you carry the accent
	"control elevation" edge — the same lit bottom stroke every button in
	SourceScheme.res has. Entrances use the theme's standard 167ms ease-out.

	To reskin: change only the ACCENT block in the palette. Everything below
	refers to it by name.
-----------------------------------------------------------------------------]]

local enabled		= CreateClientConVar( "umbraflow_killfeed", "1", true, false, "Draw the Umbraflow kill feed in place of the default one.", 0, 1 )
local tint_icons	= CreateClientConVar( "umbraflow_killfeed_icons", "1", true, false, "Tint the stock Half-Life 2 kill icons with the Umbraflow accent.", 0, 1 )

-- hud_deathnotice_time belongs to the base gamemode, not the engine, and this
-- file can run before the gamemode has created it — so both are resolved on
-- first use rather than here, where GetConVar could still answer nil.
local cl_drawhud, hud_deathnotice_time

local function ConVars()

	cl_drawhud = cl_drawhud or GetConVar( "cl_drawhud" )
	hud_deathnotice_time = hud_deathnotice_time or GetConVar( "hud_deathnotice_time" )

	return cl_drawhud, hud_deathnotice_time

end

---------------------------------------- PALETTE ----------------------------------------
-- Mirrors the Colors block of resource/SourceScheme.res.

local ACCENT		= Color( 177, 140, 255 )	-- green: 108 203 95

-- --acrylic-strong. The feed sits over gameplay — often a bright skybox — so it
-- takes the opaque end of the theme's surface range: a lighter, more
-- translucent card lets the scene through and stops reading as a surface.
local SURFACE		= Color( 32, 32, 32, 235 )
local STROKE		= Color( 255, 255, 255, 15 )	-- --stroke-card
local SHADOW		= Color( 0, 0, 0, 66 )

local TEXT_PRIMARY	= Color( 255, 255, 255 )
local CRITICAL		= Color( 255, 153, 164 )	-- #FF99A4
local SUCCESS		= Color( 108, 203, 95 )		-- #6CCB5F

-- Shape and motion, from the same tokens the stylesheets use.
local RADIUS	= 7		-- --radius-card
local DUR		= 0.167	-- --dur
local FADE		= 0.5	-- how long the tail fade runs for
local MARGIN	= 16	-- gap to the screen edge the stack right-aligns against

---------------------------------------- FONT ----------------------------------------
-- Segoe UI Semibold is the theme's chrome font. Non-Windows installs fall back
-- to Verdana, exactly as the [$WINDOWS] conditionals in SourceScheme.res do.

local FONT = "Umbraflow.Killfeed"

local function BuildFont()

	surface.CreateFont( FONT, {
		font		= system.IsWindows() and "Segoe UI Semibold" or "Verdana",
		extended	= true,
		size		= math.max( 14, math.Round( ScrH() * 0.0185 ) ),
		weight		= 600,
		antialias	= true
	} )

end

BuildFont()
hook.Add( "OnScreenSizeChanged", "Umbraflow.Killfeed.Font", BuildFont )

---------------------------------------- KILL ICONS ----------------------------------------
-- The stock icons are drawn in Half-Life 2 orange (255 80 0), which is the one
-- colour on screen that the violet has no relationship with. Re-registering
-- them in the accent is the only way to restyle them: killicon keeps its Icons
-- table private, so an existing icon's colour cannot be reached and mutated.
--
-- Only the classes base/gamemode/cl_deathnotice.lua registers are touched. An
-- alias shares its target's table by reference, so re-registering a class
-- leaves its aliases pointing at the old orange entry — they are replayed too.

local STOCK_ICONS = {
	{ "prop_physics",		"9", 0.52 },
	{ "weapon_smg1",		"/", 0.55 },
	{ "weapon_357",			".", 0.55 },
	{ "weapon_ar2",			"2", 0.6 },
	{ "crossbow_bolt",		"1", 0.5 },
	{ "weapon_shotgun",		"0", 0.45 },
	{ "rpg_missile",		"3", 0.35 },
	{ "npc_grenade_frag",	"4", 0.56 },
	{ "weapon_pistol",		"-", 0.52 },
	{ "prop_combine_ball",	"8", 0.5 },
	{ "grenade_ar2",		"7", 0.35 },
	{ "weapon_stunstick",	"!", 0.6 },
	{ "npc_satchel",		"*", 0.53 },
	{ "weapon_crowbar",		"6", 0.45 },
	{ "weapon_physcannon",	",", 0.55 }
}

local STOCK_ALIASES = {
	{ "npc_tripmine", "npc_satchel" },
	{ "weapon_crowbar_hl1", "weapon_crowbar" },
	{ "crossbow_bolt_hl1", "crossbow_bolt" },
	{ "weapon_357_hl1", "weapon_357" },
	{ "weapon_mp5_hl1", "weapon_smg1" },
	{ "weapon_shotgun_hl1", "weapon_shotgun" },
	{ "weapon_glock_hl1", "weapon_pistol" },
	{ "rpg_rocket", "rpg_missile" },
	{ "grenade_hand", "npc_grenade_frag" },
	{ "prop_ragdoll", "prop_physics" },
	{ "prop_physics_respawnable", "prop_physics" },
	{ "func_physbox", "prop_physics" },
	{ "func_physbox_multiplayer", "prop_physics" },
	{ "trigger_vphysics_motion", "prop_physics" },
	{ "func_movelinear", "prop_physics" },
	{ "func_plat", "prop_physics" },
	{ "func_platrot", "prop_physics" },
	{ "func_pushable", "prop_physics" },
	{ "func_rotating", "prop_physics" },
	{ "func_rot_button", "prop_physics" },
	{ "func_tracktrain", "prop_physics" },
	{ "func_train", "prop_physics" },
	{ "prop_vehicle_jeep", "prop_physics" },
	{ "prop_vehicle_jeep_old", "prop_physics" },
	{ "prop_vehicle_apc", "prop_physics" },
	{ "prop_vehicle_prisoner_pod", "prop_physics" },
	{ "prop_vehicle_airboat", "prop_physics" }
}

local function TintIcons()

	if ( !tint_icons:GetBool() ) then return end

	for _, icon in ipairs( STOCK_ICONS ) do
		killicon.AddFont( icon[1], "HL2MPTypeDeath", icon[2], ACCENT, icon[3] )
	end

	for _, alias in ipairs( STOCK_ALIASES ) do
		killicon.AddAlias( alias[1], alias[2] )
	end

end

-- Autorun runs before the gamemode registers its icons, so wait for Initialize.
hook.Add( "Initialize", "Umbraflow.Killfeed.Icons", TintIcons )
cvars.AddChangeCallback( "umbraflow_killfeed_icons", TintIcons, "Umbraflow.Killfeed" )

---------------------------------------- NOTICES ----------------------------------------

local Deaths = {}

-- Teams that carry no meaning are the ones the base gamemode parks everyone in
-- when a gamemode has no teams at all — sandbox included. Their colours are
-- engine defaults, not a design decision, so the theme's text ramp is used
-- instead. A gamemode with real teams keeps its own colours: those are
-- information, and the theme has no business overwriting them.
local NEUTRAL_TEAMS = {
	[ TEAM_CONNECTING or 0 ]	= true,
	[ TEAM_UNASSIGNED or 1001 ]	= true,
	[ TEAM_SPECTATOR or 1002 ]	= true
}

local function NoticeColor( teamID, fallback )

	if ( teamID == -1 ) then return CRITICAL end	-- hostile NPC
	if ( teamID == -2 ) then return SUCCESS end	-- friendly NPC

	if ( teamID >= 0 and !NEUTRAL_TEAMS[ teamID ] and team.Valid( teamID ) ) then
		return team.GetColor( teamID )
	end

	return fallback

end

-- NPC names arrive as translation tokens ("#npc_zombie"). The stock feed prints
-- them raw; draw.SimpleText does no lookup of its own.
local function Translate( name )

	if ( !isstring( name ) ) then return name end
	if ( !name:StartsWith( "#" ) ) then return name end

	return language.GetPhrase( name:sub( 2 ) )

end

hook.Add( "AddDeathNotice", "Umbraflow.Killfeed", function( attacker, team1, inflictor, victim, team2, flags )

	if ( !enabled:GetBool() ) then return end

	if ( inflictor == "suicide" ) then attacker = nil end

	local ply = LocalPlayer()
	local myName = IsValid( ply ) and ply:Name() or nil

	table.insert( Deaths, {
		time	= CurTime(),
		left	= Translate( attacker ),
		right	= Translate( victim ),
		icon	= inflictor,
		flags	= flags,
		color1	= NoticeColor( team1, TEXT_PRIMARY ),
		color2	= NoticeColor( team2, CRITICAL ),

		-- Only names reach us, so a name match is as close as we get to knowing
		-- the row is about you. Worth it: the accent edge is the whole point.
		mine	= myName != nil and ( attacker == myName or victim == myName )
	} )

	-- Suppress the gamemode's own AddDeathNotice so it doesn't keep a parallel
	-- list we never draw. This does shadow a gamemode with a custom feed of its
	-- own — "umbraflow_killfeed 0" hands it straight back.
	return true

end )

---------------------------------------- DRAW ----------------------------------------

-- A 1px rounded stroke: the outline colour at full size, the fill inset into
-- it. VGUI has no rounded outline, and neither does draw.
local function StrokedBox( x, y, w, h, fill, stroke )

	draw.RoundedBox( RADIUS, x, y, w, h, stroke )
	draw.RoundedBox( RADIUS, x + 1, y + 1, w - 2, h - 2, fill )

end

-- Draws one notice with its top edge at y, and returns the height it took, so
-- the caller stacks against where rows are headed rather than where they are.
local function DrawDeath( y, death, lifetime )

	local iw, ih = killicon.GetSize( death.icon )
	if ( !iw or !ih ) then return 0 end

	local age		= CurTime() - death.time
	local remaining	= ( death.time + lifetime ) - CurTime()

	-- Entrance: 167ms, eased out — the cubic-bezier(0.1, 0.9, 0.2, 1) of the
	-- stylesheets, near enough for a 40px slide.
	local enter	= math.Clamp( age / DUR, 0, 1 )
	local eased	= 1 - ( 1 - enter ) ^ 3
	local frac	= math.min( eased, math.Clamp( remaining / FADE, 0, 1 ) )
	local alpha	= math.floor( frac * 255 )

	surface.SetFont( FONT )
	local lw, th = 0, 0
	if ( death.left ) then lw, th = surface.GetTextSize( death.left ) end
	local rw, rh = surface.GetTextSize( death.right )
	th = math.max( th, rh )

	local pad	= 10
	local gap	= 10
	local slide	= ( 1 - eased ) * 40

	-- The card packs left to right — name, icon, name — and right-aligns to the
	-- margin. The base feed instead centres the icon on an anchor and lets the
	-- names run out either side of it, which a card can't do: its right edge has
	-- to be the fixed thing, or rows of differing name lengths sit ragged
	-- against the screen and the stack stops reading as one column. So the
	-- caller's x anchor is deliberately dropped, not honoured.
	local lead	= death.left and ( lw + gap ) or 0
	local cardW	= pad + lead + iw + gap + rw + pad
	local cardH	= math.max( ih, th ) + pad
	local iconX	= pad + lead

	local cardX	= math.floor( ScrW() - MARGIN - cardW + slide )
	local cardY	= math.floor( y )

	surface.SetAlphaMultiplier( frac )

		draw.RoundedBox( RADIUS, cardX - 1, cardY + 2, cardW + 2, cardH, SHADOW )
		StrokedBox( cardX, cardY, cardW, cardH, SURFACE, STROKE )

		-- Fluent control elevation: in dark theme the lit edge sits along the
		-- bottom, which is what makes a control read as raised. Same trick the
		-- RaisedBorder in SourceScheme.res plays on every button.
		--
		-- This edge is the only accent on the card. A tint was tried across the
		-- whole surface and had to go: nearly every row in your own feed involves
		-- you, so the highlight stopped marking anything and just turned the feed
		-- violet. The edge says the same thing without repainting the surface.
		if ( death.mine ) then
			surface.SetDrawColor( ACCENT )
			surface.DrawRect( cardX + RADIUS, cardY + cardH - 1, cardW - RADIUS * 2, 1 )
		end

	surface.SetAlphaMultiplier( 1 )

	local midY = cardY + cardH / 2

	killicon.Render( math.floor( cardX + iconX ), math.floor( midY - ih / 2 ), death.icon, alpha )

	if ( death.left ) then
		draw.SimpleText( death.left, FONT, cardX + pad, midY, ColorAlpha( death.color1, alpha ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end

	draw.SimpleText( death.right, FONT, cardX + cardW - pad, midY, ColorAlpha( death.color2, alpha ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )

	return cardH

end

hook.Add( "DrawDeathNotice", "Umbraflow.Killfeed", function( x, y )

	if ( !enabled:GetBool() ) then return end

	local drawhud, noticetime = ConVars()

	-- Returning true from here suppresses the gamemode's own draw, so the early
	-- outs have to return true as well — otherwise hiding the HUD would show the
	-- stock feed through it.
	if ( drawhud and drawhud:GetInt() == 0 ) then return true end

	local lifetime = noticetime and noticetime:GetFloat() or 6

	-- Expired entries, oldest first. Nothing else prunes this table.
	for i = #Deaths, 1, -1 do
		if ( Deaths[ i ].time + lifetime <= CurTime() ) then
			table.remove( Deaths, i )
		end
	end

	-- y is the top of the stack, as a screen fraction. Only y is taken from the
	-- caller; see DrawDeath for why the x anchor is dropped.
	local targetY = y * ScrH()

	for _, death in ipairs( Deaths ) do

		-- Rows ease up into the gap an expired row leaves behind rather than
		-- snapping to it. A new row starts already at its target: it has the
		-- entrance slide to make, and animating both at once reads as a stumble.
		death.y = death.y and math.Approach( death.y, targetY, math.abs( death.y - targetY ) * FrameTime() * 12 ) or targetY

		targetY = targetY + DrawDeath( death.y, death, lifetime ) + 6

	end

	return true

end )
