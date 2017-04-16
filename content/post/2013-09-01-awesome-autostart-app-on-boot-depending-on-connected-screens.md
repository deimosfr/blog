---
title: 'Awesome : autostart app on boot depending on connected screens'
author: Deimos
type: post
date: 2013-09-01T10:00:06+00:00
url: /2013/09/01/awesome-autostart-app-on-boot-depending-on-connected-screens/
image: /images/logo_awesome.png
thumbnailImage: /thumbnails/logo_awesome.png
thumbnailImagePosition: left
categories:
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat
tags:
  - Debian
  - Hi-Tech
  - Linux
  - Red Hat

---
![Awesome_logo](/images/logo_awesome.png)
[Awesome](https://wiki.deimos.fr/Awesome_:_un_bureau_l%C3%A9ger_et_puissant) is still my window manager and I still love it. With my laptop, I need to be able to quickly get my working environment when I power it on. The major problem I had was to avoid having the same opened windows at boot if I'm in the train, at work or at home. Of course there is no GPS in the laptop to detect my location, so I couldn't set a rule for it. By the way, I do not have the same number of screens depending on my location :

  * 1 screen : standalone mode, like train etc... I don't want applications to start automatically
  * 2 screens : I don't have this case for the moment
  * 3 screens : this configuration is when I'm at work. And what I need is to have Pidgin, Firefox and Thunderbird running at start on different screens

That's why I've configured Awesome to take care of that 2 kinds of configuration. To did it, I've added those lines in my rc.lua configuration :

{{< highlight lua >}}
if screen.count() == 3 then
    -- Desktop/tags organization
    -- {{{ Rules
    awful.rules.rules = { 
        -- All clients will match this rule.
        { rule = { },
          properties = { border_width = beautiful.border_width,
                         border_color = beautiful.border_normal,
                         focus = true,
                         keys = clientkeys,
                         buttons = clientbuttons } },
        -- Set Firefox to always map on tags number 2 of screen 1.
        { rule = { class = "Firefox" },  properties = { tag = tags[2][1] } },
        { rule = { class = "Thunderbird" },  properties = { tag = tags[3][1] } },
        { rule = { class = "Pidgin" },  properties = { tag = tags[1][4], switchtotag = true } },
    }   
    -- Launch those commands on startup
    run_once("thunderbird")
    run_once("firefox")
    run_once("pidgin")
-- 1 screen, I'm nomad
elseif screen.count() == 1 then
    awful.util.spawn_with_shell("xrandr --output DP3 --off --output DP2 --off --output DP1 --off --output HDMI3 --off --output HDMI2 --off --output HDMI1 --off --output LVDS1 --mode 1600x900 --pos 0x0 --rotate normal --output VGA1 --off")
    -- Desktop/tags organization
    -- {{{ Rules
    awful.rules.rules = { 
        -- All clients will match this rule.
        { rule = { },
          properties = { border_width = beautiful.border_width,
                         border_color = beautiful.border_normal,
                         focus = true,
                         keys = clientkeys,
                         buttons = clientbuttons } },
    }   
    -- }}}
end
{{< /highlight >}}

I've added comments to get a better understanding on what each lines does, but the most important are :

  * rule : which define application's properties on a screen with the desired tag
  * run_once : to launch an application on boot

Note : I do not set any xrandr configuration when I've 3 screens as this is my default and already set in my .xinitrc file.

As a reminder, you can have access to [my complete Awesome configuration here](https://git.deimos.fr/?p=git_deimosfr.git;a=tree;f=user_config/awesome).
