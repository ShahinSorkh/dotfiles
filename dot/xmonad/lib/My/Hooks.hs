module My.Hooks (myManageHook, myStartupHooks) where

import XMonad
  ( ManageHook
  , X
  , className
  , composeAll
  , doFloat
  , title
  , (-->)
  , (=?)
  )
import XMonad.Hooks.ManageHelpers (isDialog)
import XMonad.Util.SpawnOnce (spawnOnce)

myManageHook :: ManageHook
myManageHook =
  composeAll
    [ className =? "Gimp" --> doFloat
    , title =? "doom-capture" --> doFloat
    , isDialog --> doFloat
    ]

myStartupHooks :: X ()
myStartupHooks = do
  spawnOnce "feh --bg-scale --no-fehbg ~/.i3/105857-1.jpg &"
  spawnOnce "picom &"
  spawnOnce "emacs --daemon &"
  spawnOnce "trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --transparent true --alpha 0 --tint 0x282c34  --height 22 &"
  spawnOnce "volumeicon &"
  spawnOnce "nm-applet &"
  spawnOnce "cfw &"
