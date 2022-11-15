module My.Hooks (myManageHook, myStartupHooks) where

import My.StatusBar (myWorkspaces)
import XMonad
  ( ManageHook
  , X
  , className
  , composeAll
  , doFloat
  , doShift
  , title
  , (-->)
  , (=?)
  )
import XMonad.Hooks.ManageHelpers (isDialog, doCenterFloat)
import XMonad.Util.SpawnOnce (spawnOnce)

myManageHook :: ManageHook
myManageHook =
  composeAll
    [ className =? "Gimp" --> doFloat
    , className =? "TelegramDesktop" --> doFloat
    , className =? "discord" --> doShift ( myWorkspaces !! 2 )
    , className =? "Slack" --> doShift ( myWorkspaces !! 2 )
    , title =? "doom-capture" --> doCenterFloat
    , isDialog --> doFloat
    ]

myStartupHooks :: X ()
myStartupHooks = do
  spawnOnce "~/.bin/lightson &"
  spawnOnce "xss-lock -- slock &"
  spawnOnce "feh --bg-scale --no-fehbg ~/.i3/105857-1.jpg &"
  spawnOnce "picom &"
  spawnOnce "trayer --iconspacing 6 --edge top --align right --widthtype request --padding 8 --SetDockType true --SetPartialStrut true --expand true --monitor primary --transparent true --alpha 0 --tint 0xfafafa  --height 22 &"
  spawnOnce "volumeicon &"
  spawnOnce "nm-applet &"
  spawnOnce "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &"
