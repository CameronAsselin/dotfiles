-- Set programs

local terminal = "kitty"
local fileManager = "thunar"
local text = "mousepad"
local browser = "firefox"
local email = "thunderbird"
local passwords = "bitwarden-desktop"
local menu = "rofi -show drun"
local menuAlt = "rofi -show run"
local bluetooth = "blueman-applet"

-- Set monitor(s)

hl.monitor({
    output = "DP-1",
    mode = "3840x2160@144",
    position = "auto",
    scale = "1",
})
hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "auto",
    scale = "1",
})

-- Config

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        touchpad = {
            natural_scroll = false,
        },
        sensitivity = .25, -- -1.0 to 1.0, 0 means no modification.
    },
    general = {
        gaps_in = 10,
        gaps_out = 20,
        border_size = 2,
        col = {
            active_border = { colors = { "rgb(c6a0f6)", "rgb(f4b8e4)" }, angle = 45 },
            inactive_border = "rgb(51576d)",
        },
        layout = "dwindle",
        -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
    },
    decoration = {
        rounding = 10,
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
        },
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true, -- you probably want this
    },
})

-- Animations

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 7,
    bezier = "myBezier",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 7,
    bezier = "default",
    style = "popin 80%",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default",
})
hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 8,
    bezier = "default",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 7,
    bezier = "default",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 6,
    bezier = "default",
})

-- Window rules

hl.window_rule({
    match = {
        class = "^(com.github.hluk.copyq)$",
    },
    float = true,
    size = "500 500",
})
hl.window_rule({
    match = {
        class = "^(flameshot)$",
    },
    float = true,
})
hl.window_rule({
    match = {
        class = "^(org.gnome.Calculator)$",
    },
    float = true,
})
hl.window_rule({
    match = {
        class = "^(blueman-manager)$",
    },
    float = true,
    size = "500 500",
})
hl.window_rule({
    match = {
        class = "^(nm-connection-editor)$",
    },
    float = true,
})
hl.window_rule({
    match = {
        class = "^(org.pulseaudio.pavucontrol)$",
    },
    float = true,
    size = "700 700",
})
hl.window_rule({
    match = {
        class = "^(Bitwarden)$",
    },
    float = true,
    center = true,
    size = "900 700",
})
hl.window_rule({
    match = {
        title = "^(File Operation Progress)$",
    },
    float = true,
})

-- Keybinds

local mod = "SUPER"

hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + R", hl.dsp.exec_cmd("~/.config/waybar/scripts/launch.sh"))
hl.bind(mod .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mod .. " + E", hl.dsp.exec_cmd(email))
hl.bind(mod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + SHIFT + D", hl.dsp.exec_cmd(menuAlt))
hl.bind(mod .. " + 0x002e", hl.dsp.exec_cmd("rofi -show emoji"))
hl.bind(mod .. " + P", hl.dsp.exec_cmd(passwords))
hl.bind(mod .. " + K", hl.dsp.window.pseudo())
hl.bind(mod .. " + T", hl.dsp.exec_cmd(text))
hl.bind(mod .. " + V", hl.dsp.exec_cmd("copyq toggle"))
hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("kitty wf-recorder -f ~/Videos/screenrecording_$(date +\"%Y_%m_%d_%s\").mp4"))

hl.bind("xf86KbdBrightnessUp", hl.dsp.exec_cmd("brightnessctl -d *::kbd_backlight set +33%"))
hl.bind("xf86KbdBrightnessDown", hl.dsp.exec_cmd("brightnessctl -d *::kbd_backlight set 33%-"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.config/dunst/scripts/volume_brightness_wayland.sh volume_up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.config/dunst/scripts/volume_brightness_wayland.sh volume_down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/.config/dunst/scripts/volume_brightness_wayland.sh volume_mute"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.config/dunst/scripts/volume_brightness_wayland.sh brightness_up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/dunst/scripts/volume_brightness_wayland.sh brightness_down"))

hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

hl.bind(mod .. " + ALT + right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }))
hl.bind(mod .. " + ALT + left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }))
hl.bind(mod .. " + ALT + up", hl.dsp.window.resize({ x = 0, y = -20, relative = true }))
hl.bind(mod .. " + ALT + down", hl.dsp.window.resize({ x = 0, y = 20, relative = true }))

hl.bind(mod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mod .. " + CONTROL + left", hl.dsp.focus({ workspace = -1 }))
hl.bind(mod .. " + CONTROL + right", hl.dsp.focus({ workspace = "+1" }))

hl.bind(mod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = -1 }))

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize())

hl.bind(mod .. " + CONTROL + 1", hl.dsp.exec_cmd(terminal .. " nvim ~/.config/hypr/hyprland.lua"))
hl.bind(mod .. " + CONTROL + 2", hl.dsp.exec_cmd(terminal .. " nvim ~/.config/waybar/config"))
hl.bind(mod .. " + CONTROL + 3", hl.dsp.exec_cmd(terminal .. " nvim ~/.config/rofi/custom.rasi"))
hl.bind(mod .. " + CONTROL + 4", hl.dsp.exec_cmd(terminal .. " nvim ~/.config/kitty/kitty.conf"))

-- Startup apps

hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
    hl.exec_cmd("dunst")
    hl.exec_cmd("monerod")
    hl.exec_cmd("~/.config/waybar/scripts/launch.sh")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd(bluetooth)
    hl.exec_cmd("copyq")
    hl.exec_cmd(terminal, { workspace = "2" })
    hl.exec_cmd(email, { workspace = "3" })
    hl.exec_cmd(browser, { workspace = "1" })
end)
