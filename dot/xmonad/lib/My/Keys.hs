module My.Keys (myModeMask, myKeys, myKeysX) where

import Data.Bits ((.|.))
import Graphics.X11.ExtraTypes.XF86
import Graphics.X11.Types
import My.Pass (passPrompt', passGeneratePrompt', passRemovePrompt', passEditPrompt')
import XMonad (X , io , spawn)
import XMonad.Util.Ungrab (unGrab)

myModeMask :: KeyMask
myModeMask = mod4Mask

modShiftMask = myModeMask .|. shiftMask
modCtrlMask = myModeMask .|. controlMask
modCtrlShiftMask = modCtrlMask .|. shiftMask

cycleKbdLayoutKey = (mod1Mask .|. mod4Mask, xK_space) -- super+alt+space

myKeys :: [(String, X ())]
myKeys =
  [ ("M-S-z", spawn "xscreensaver-command -lock")
  , ("M-S-=", unGrab *> spawn "scrot -s")
  , ("M-]",   spawn "firefox")
  , ("M-[",   spawn "emacsclient -c -a 'emacs'")
  , ("M-n",   spawn "~/.emacs.d/bin/org-capture")
  ]

myKeysX :: [((KeyMask, KeySym), X ())]
myKeysX = brightnessKeys ++ volumeKeys ++ passKeys ++ miscKeys
  where
    brightnessKeys =
      [ ((0, xF86XK_MonBrightnessDown),           spawn $ backlightModify "-dec 20")
      , ((shiftMask, xF86XK_MonBrightnessDown),   spawn $ backlightModify "-dec 10")
      , ((controlMask, xF86XK_MonBrightnessDown), spawn $ backlightModify "-set 5")
      , ((0, xF86XK_MonBrightnessUp),             spawn $ backlightModify "-inc 20")
      , ((shiftMask, xF86XK_MonBrightnessUp),     spawn $ backlightModify "-inc 10")
      , ((controlMask, xF86XK_MonBrightnessUp),   spawn $ backlightModify "-set 100")
      ]
    volumeKeys =
      [ ((0, xF86XK_AudioRaiseVolume),            spawn $ volumeModify "set-sink-volume +10%")
      , ((shiftMask, xF86XK_AudioRaiseVolume),    spawn $ volumeModify "set-sink-volume +5%")
      , ((controlMask, xF86XK_AudioRaiseVolume),  spawn $ volumeModify "set-sink-volume 100%")
      , ((0, xF86XK_AudioLowerVolume),            spawn $ volumeModify "set-sink-volume -10%")
      , ((shiftMask, xF86XK_AudioLowerVolume),    spawn $ volumeModify "set-sink-volume -5%")
      , ((controlMask, xF86XK_AudioLowerVolume),  spawn $ volumeModify "set-sink-volume 5%")
      , ((0, xF86XK_AudioMute),                   spawn $ volumeModify "set-sink-mute toggle")
      ]
    passKeys =
      [ ((myModeMask, xK_x),       passPrompt')
      , ((modCtrlMask, xK_x),      passGeneratePrompt')
      , ((modShiftMask, xK_x),     passEditPrompt')
      , ((modCtrlShiftMask, xK_x), passRemovePrompt')
      ]
    miscKeys =
      [ ((0, xF86XK_PowerDown),   spawn "systemctl suspend-then-hibernate") ,
        (cycleKbdLayoutKey,       spawn "~/.bin/dunst/cycle-kbd-layout.sh")
      ]

backlightModify :: String -> String
backlightModify args = "~/.bin/dunst/backlight-modify.sh " ++ args

volumeModify :: String -> String
volumeModify args = "~/.bin/dunst/volume-modify.sh " ++ args
