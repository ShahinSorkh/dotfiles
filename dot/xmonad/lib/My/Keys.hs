module My.Keys (myModeMask, myKeys, myKeysX) where

import Graphics.X11.ExtraTypes.XF86
  ( xF86XK_AudioLowerVolume
  , xF86XK_AudioMute
  , xF86XK_AudioRaiseVolume
  , xF86XK_MonBrightnessDown
  , xF86XK_MonBrightnessUp
  , xF86XK_PowerDown
  )
import Graphics.X11.Types
import System.Exit (exitSuccess)
import XMonad
  ( KeyMask
  , KeySym
  , X
  , controlMask
  , io
  , mod4Mask
  , shiftMask
  , spawn
  , (.|.), xK_KP_Space, mod1Mask
  )
import XMonad.Util.Ungrab (unGrab)

myModeMask :: KeyMask
myModeMask = mod4Mask

myKeys :: [(String, X ())]
myKeys =
  [ ("M-S-z", spawn "xscreensaver-command -lock")
  , ("M-S-=", unGrab *> spawn "scrot -s")
  , ("M-]", spawn "firefox")
  , ("M-[", spawn "emacsclient -c -a 'emacs'")
  ]

myKeysX :: [((KeyMask, KeySym), X ())]
myKeysX = brightnessKeys ++ volumeKeys ++ miscKeys
  where
    brightnessKeys =
      [ ((0, xF86XK_MonBrightnessDown), spawn "~/.bin/dunst/backlight-modify.sh -dec 20")
      , ((shiftMask, xF86XK_MonBrightnessDown), spawn "~/.bin/dunst/backlight-modify.sh -dec 10")
      , ((controlMask, xF86XK_MonBrightnessDown), spawn "~/.bin/dunst/backlight-modify.sh -set 5")
      , ((0, xF86XK_MonBrightnessUp), spawn "~/.bin/dunst/backlight-modify.sh -inc 20")
      , ((shiftMask, xF86XK_MonBrightnessUp), spawn "~/.bin/dunst/backlight-modify.sh -inc 10")
      , ((controlMask, xF86XK_MonBrightnessUp), spawn "~/.bin/dunst/backlight-modify.sh -set 100")
      ]
    volumeKeys =
      [ ((0, xF86XK_AudioRaiseVolume), spawn "~/.bin/dunst/volume-modify.sh set-sink-volume +10%")
      , ((shiftMask, xF86XK_AudioRaiseVolume), spawn "~/.bin/dunst/volume-modify.sh set-sink-volume +5%")
      , ((controlMask, xF86XK_AudioRaiseVolume), spawn "~/.bin/dunst/volume-modify.sh set-sink-volume 100%")
      , ((0, xF86XK_AudioLowerVolume), spawn "~/.bin/dunst/volume-modify.sh set-sink-volume -10%")
      , ((shiftMask, xF86XK_AudioLowerVolume), spawn "~/.bin/dunst/volume-modify.sh set-sink-volume -5%")
      , ((controlMask, xF86XK_AudioLowerVolume), spawn "~/.bin/dunst/volume-modify.sh set-sink-volume 5%")
      , ((0, xF86XK_AudioMute), spawn "~/.bin/dunst/volume-modify.sh set-sink-mute toggle")
      ]
    miscKeys =
      [ ((0, xF86XK_PowerDown), spawn "sudo pm-suspend")
      , ((mod1Mask .|. mod4Mask, xK_space), spawn "$HOME/.bin/dunst/cycle-kbd-layout.sh") -- super+alt+space
      ]
