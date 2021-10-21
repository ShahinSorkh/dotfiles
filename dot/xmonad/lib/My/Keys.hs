module My.Keys (myModeMask, myKeys, myKeysX) where

import XMonad
import XMonad.Util.Ungrab
import Graphics.X11.ExtraTypes.XF86
import System.Exit (exitSuccess)

myModeMask :: KeyMask
myModeMask = mod4Mask

myKeys :: [(String, X ())]
myKeys =
  [ ("M-S-z", spawn "xscreensaver-command -lock")
  , ("M-S-=", unGrab *> spawn "scrot -s")
  , ("M-]", spawn "firefox")
  , ("M-[", spawn "emacs")
  , ("M-S-q", io exitSuccess)
  ]

myKeysX :: [((KeyMask, KeySym), X ())]
myKeysX =
  [ ((0, xF86XK_PowerDown), spawn "sudo pm-suspend")
  ] ++ [ -- volume
    ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%")
  , ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%")
  , ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
  ] ++ [ -- brightness
    ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10%")
  , ((shiftMask, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 20%")
  , ((shiftMask .|. controlMask, xF86XK_MonBrightnessDown), spawn "xbacklight -set 5")
  , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 10")
  , ((shiftMask, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 20")
  , ((shiftMask .|. controlMask, xF86XK_MonBrightnessUp), spawn "xbacklight -set 100")
  ]
