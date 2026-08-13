---@module 'hl'

local mod = "SUPER"

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = "eDP-1",
    mode     = "2560x1440@165",
    position = "0x1080",
    scale    = 1.6,
})

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

hl.on("hyprland.start", function()
    hl.exec_cmd("wl-clip-persist --clipboard regular &")
    hl.exec_cmd("qs -c noctalia-shell --no-duplicate")
    hl.exec_cmd("copyq --start-server")
end)

hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)

hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 4,
        border_size = 2,
        resize_on_border = true,
        allow_tearing = true,
        layout = "dwindle",
        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
    },
})

hl.config({
    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
})

hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1, }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05, }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0, }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5, }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0, }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = false, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = false, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = false, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.config({
    dwindle = {
        preserve_split = true,
        force_split = 2,
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

hl.bind(mod .. " + period", hl.dsp.layout("swapcol r"))
hl.bind(mod .. " + comma", hl.dsp.layout("swapcol l"))
hl.bind(mod .. " + semicolon", hl.dsp.layout("fit visible"))
hl.bind(mod .. " + P", hl.dsp.layout("promote"))
hl.bind(mod .. " + SHIFT + R", hl.dsp.layout("colresize +conf"))

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    misc = {
        force_default_wallpaper = -1,
        -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true,
        -- If true disables the random hyprland logo / anime girl background. :(
    },
})

hl.config({
    input = {
        kb_layout = "us,ru,ua",
        kb_options = "ctrl:nocaps",
        repeat_rate = 60,
        repeat_delay = 300,
        follow_mouse = 1,
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.2,
        },
    },
})

hl.config({
    group = {
        groupbar = {
            font_size = 12,
            gradients = true,
            gradient_rounding = 6,
            indicator_height = 0,
            text_color = "rgba(000000ff)",
            text_color_inactive = "rgba(ffffffff)",
            col = {
                active = "rgba(33ccffcc)",
                inactive = "rgba(595959aa)",
                locked_active = "rgba(ff5500cc)",
                locked_inactive = "rgba(775500aa)",
            }
        },
        col = {
            border_active = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            border_inactive = "rgba(595959aa)",
        },
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.bind(mod .. " + S",
    hl.dsp.exec_cmd("hyprctl keyword workspace $(hyprctl activeworkspace -j| jq \".id\" ),layout:scrolling"))
hl.bind(mod .. " + D",
    hl.dsp.exec_cmd("hyprctl keyword workspace $(hyprctl activeworkspace -j| jq \".id\" ),layout:dwindle"))
hl.bind(mod .. " + M",
    hl.dsp.exec_cmd("hyprctl keyword workspace $(hyprctl activeworkspace -j| jq \".id\" ),layout:master"))

hl.bind(mod .. " + SHIFT + M",
    hl.dsp.exec_cmd("hyprctl keyword monitor HDMI-A-1,1920x1080@60,0x0,1; hyprctl keyword monitor eDP-1,disable"))
hl.bind(mod .. " + SHIFT + N",
    hl.dsp.exec_cmd("hyprctl keyword monitor eDP-1,2560x1440@165,0x1080,1.6; hyprctl keyword monitor HDMI-A-1,disable"))
hl.bind(mod .. " + SHIFT + B",
    hl.dsp.exec_cmd(
        "hyprctl keyword monitor eDP-1,2560x1440@165,0x1080,1.6; hyprctl keyword monitor HDMI-A-1,1920x1080@60,0x0,1"))

hl.bind(mod .. " + SHIFT + ALT + L", hl.dsp.exec_cmd("swaylock --color=000000 --show-failed-attempts"))

hl.bind("ALT + W", hl.dsp.group.toggle())
hl.bind("ALT + H", hl.dsp.group.next({ forward = false }))
hl.bind("ALT + L", hl.dsp.group.next())
hl.bind("ALT + SHIFT + H", hl.dsp.exec_cmd("hyprctl --batch \"dispatch movegroupwindow b; dispatch changegroupactive b\""))
hl.bind("ALT + SHIFT + L", hl.dsp.exec_cmd("hyprctl --batch \"dispatch movegroupwindow f; dispatch changegroupactive f\""))
hl.bind("ALT + I", hl.dsp.group.lock_active({ action = "toggle" }))
hl.bind("ALT + U", hl.dsp.window.move({ out_of_group = true }))
hl.bind("ALT + H", hl.dsp.window.move({ into_group = "left" }))
hl.bind("ALT + J", hl.dsp.window.move({ into_group = "down" }))
hl.bind("ALT + K", hl.dsp.window.move({ into_group = "up" }))
hl.bind("ALT + L", hl.dsp.window.move({ into_group = "right" }))
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only --silent"))
hl.bind(mod .. " + SHIFT + A", hl.dsp.exec_cmd("hyprshot -m region --raw | satty --disable-notifications --filename -"))
hl.bind(mod .. " + V", hl.dsp.exec_cmd("copyq show"))
hl.bind(mod .. " + Return", hl.dsp.exec_cmd("ghostty"))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + ALT + E",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind(mod .. " + SHIFT + SPACE", hl.dsp.window.float())
hl.bind(mod .. " + O", hl.dsp.exec_cmd("fuzzel"))
hl.bind(mod .. " + E", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
    hl.bind("H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
    hl.bind("K", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
    hl.bind("J", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
    hl.bind("escape", hl.dsp.submap("reset"))
    hl.bind(mod .. " + R", hl.dsp.submap("reset"))
end)

hl.bind("ALT + SHIFT + 1",
    hl.dsp.exec_cmd("hyprctl switchxkblayout main 0"))
hl.bind("ALT + SHIFT + 2",
    hl.dsp.exec_cmd("hyprctl switchxkblayout main 1"))
hl.bind("ALT + SHIFT + 3",
    hl.dsp.exec_cmd("hyprctl switchxkblayout main 2"))

hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + H", hl.dsp.window.alter_zorder({ mode = "top" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + L", hl.dsp.window.alter_zorder({ mode = "top" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + K", hl.dsp.window.alter_zorder({ mode = "top" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + J", hl.dsp.window.alter_zorder({ mode = "top" }))

hl.bind(mod .. " + CONTROL + H", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind(mod .. " + CONTROL + L", hl.dsp.workspace.move({ monitor = "r" }))
hl.bind(mod .. " + CONTROL + K", hl.dsp.workspace.move({ monitor = "u" }))
hl.bind(mod .. " + CONTROL + J", hl.dsp.workspace.move({ monitor = "d" }))

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

hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))

hl.bind("CONTROL + CONTROL_R", hl.dsp.pass({ window = "class:^(discord)$" }))
hl.bind("CONTROL + M", hl.dsp.pass({ window = "class:^(discord)$" }))

hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.window_rule({
    name           = "suppress-maximize-events",
    match          = {
        class = ".*",
    },
    suppress_event = "maximize",
})

hl.window_rule({
    name    = "copyq-float",
    match   = {
        class = "com.github.hluk.copyq",
    },
    no_anim = true,
    float   = true,
    size    = { 800, 600 },
})

hl.window_rule({
    name     = "fix-xwayland-drags",
    match    = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    name    = "ghostty-opacity",
    match   = {
        class = "com.mitchellh.ghostty",
    },
    opacity = 0.95,
})

hl.window_rule({
    name = "float-satty",
    match = {
        class = "^com.gabm.satty$",
    },
    float = true,
})
