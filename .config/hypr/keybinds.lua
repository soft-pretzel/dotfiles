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
hl.bind("SUPER + L", hl.dsp.exec_cmd(qs .. "lockScreen lock"))
hl.bind("SUPER + M", hl.dsp.exec_cmd(qs .. "sessionMenu toggle"))
hl.bind("SUPER + V", hl.dsp.exec_cmd(qs .. "launcher clipboard"))
hl.bind("SUPER + W", hl.dsp.exec_cmd(qs .. "wallpaper toggle"))
hl.bind("SUPER + comma", hl.dsp.exec_cmd(qs .. "settings toggle"))
hl.bind("SUPER + period", hl.dsp.exec_cmd(qs .. "launcher emoji"))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd(qs .. "plugin togglePanel noctalia-calculator"))
hl.bind("SUPER + SHIFT + H", hl.dsp.exec_cmd(qs .. "plugin togglePanel hassio"))
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd(qs .. "plugin togglePanel monique"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(qs .. "plugin togglePanel syncthing-status"))
hl.bind("SUPER + SHIFT + T", hl.dsp.exec_cmd(qs .. "plugin togglePanel tailscale"))
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
hl.bind("XF86RFKill", hl.dsp.exec_cmd(qs .. "airplaneMode toggle"), { locked = true })

-- Passthru submap for working in VMs
-- https://wiki.hypr.land/FAQ/#my-vm-doesnt-receive-keybinds-i-have-set-in-hyprland
hl.define_submap("passthru", function()
	hl.bind("SUPER + Escape", hl.dsp.submap("reset"))
end)
hl.bind("SUPER + Escape", hl.dsp.submap("passthru"))
