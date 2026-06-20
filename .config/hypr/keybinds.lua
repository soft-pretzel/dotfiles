---------------------
---- KEYBINDINGS ----
---------------------
-- https://wiki.hypr.land/Configuring/Basics/Binds/

-- Applications
hl.bind("SUPER + B", hl.dsp.exec_cmd("librewolf"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER + S", hl.dsp.exec_cmd('grim -g "$(slurp -b ffffff0d)" - | wl-copy'))
hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty"))

-- Window Management
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + J", hl.dsp.layout("togglesplit")) -- dwindle only
-- hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Workspaces
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + SHIFT + left", hl.dsp.focus({ workspace = "e-1" }))

-- Noctalia
-- https://docs.noctalia.dev/v4/getting-started/keybinds/keybinds/
local qs = "qs -c noctalia-shell ipc call "
hl.bind("SUPER + SUPER_L", hl.dsp.exec_cmd(qs .. "launcher toggle"))
hl.bind("SUPER + M", hl.dsp.exec_cmd(qs .. "sessionMenu toggle"))
hl.bind("SUPER + L", hl.dsp.exec_cmd(qs .. "lockScreen lock"))
hl.bind("SUPER + V", hl.dsp.exec_cmd(qs .. "launcher clipboard"))
hl.bind("SUPER + comma", hl.dsp.exec_cmd(qs .. "settings toggle"))
hl.bind("SUPER + W", hl.dsp.exec_cmd(qs .. "wallpaper toggle"))
hl.bind("SUPER + period", hl.dsp.exec_cmd(qs .. "launcher emoji"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(qs .. "volume increase"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(qs .. "volume decrease"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(qs .. "volume muteOutput"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(qs .. "volume muteInput"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(qs .. "brightness increase"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(qs .. "brightness decrease"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(qs .. "media next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(qs .. "media playPause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(qs .. "media playPause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(qs .. "media previous"), { locked = true })
hl.bind(
	"SUPER + XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(qs .. "brightness increase"),
	{ locked = true, repeating = true }
)
hl.bind(
	"SUPER + XF86AudioLowerVolume",
	hl.dsp.exec_cmd(qs .. "brightness decrease"),
	{ locked = true, repeating = true }
)

-- Passthru submap for working in VMs
-- https://wiki.hypr.land/FAQ/#my-vm-doesnt-receive-keybinds-i-have-set-in-hyprland
hl.define_submap("passthru", function()
	hl.bind("SUPER + Escape", hl.dsp.submap("reset"))
end)
hl.bind("SUPER + Escape", hl.dsp.submap("passthru"))

-- Switch to a submap called `resize`.
hl.bind("SUPER + R", hl.dsp.submap("resize"))

-- Start a submap called "resize".
hl.define_submap("resize", function()
	hl.bind("right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
	hl.bind("left", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)
