module My.Keys (myModeMask, myKeys, myKeysX) where

import Graphics.X11.ExtraTypes.XF86
  ( xF86XK_AudioLowerVolume,
    xF86XK_AudioMute,
    xF86XK_AudioRaiseVolume,
    xF86XK_MonBrightnessDown,
    xF86XK_MonBrightnessUp,
    xF86XK_PowerDown,
  )
import System.Exit (exitSuccess)
import XMonad
  ( KeyMask,
    KeySym,
    X,
    controlMask,
    io,
    mod4Mask,
    shiftMask,
    spawn,
    (.|.),
  )
import XMonad.Util.Ungrab (unGrab)

myModeMask :: KeyMask
myModeMask = mod4Mask

myKeys :: [(String, X ())]
myKeys =
  [ ("M-S-z", spawn "xscreensaver-command -lock"),
    ("M-S-=", unGrab *> spawn "scrot -s"),
    ("M-]", spawn "firefox"),
    ("M-[", spawn "emacsclient -c -a 'emacs'")
  ]

myKeysX :: [((KeyMask, KeySym), X ())]
myKeysX =
  [ ((0, xF86XK_PowerDown), spawn "sudo pm-suspend")
  ]
    ++ [ -- volume
         ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%"),
         ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%"),
         ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
       ]
    ++ [ -- brightness
         ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10%"),
         ((shiftMask, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 20%"),
         ((controlMask, xF86XK_MonBrightnessDown), spawn "xbacklight -set 5"),
         ((0, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 10"),
         ((shiftMask, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 20"),
         ((controlMask, xF86XK_MonBrightnessUp), spawn "xbacklight -set 100")
       ]
