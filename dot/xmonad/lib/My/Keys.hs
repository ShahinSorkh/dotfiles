module My.Keys (myModeMask, myKeys, myKeysX) where

import Control.Monad
import Data.Bits ((.|.))
import Graphics.X11.ExtraTypes (sunXK_Print_Screen)
import Graphics.X11.ExtraTypes.XF86
import Graphics.X11.Types
import System.Exit
import XMonad (X , io , spawn)
import XMonad.Util.Dmenu
import XMonad.Util.Ungrab (unGrab)

altMask :: KeyMask
altMask = mod1Mask

myModeMask :: KeyMask
myModeMask = mod4Mask

modShiftMask = myModeMask .|. shiftMask
modCtrlMask = myModeMask .|. controlMask
modCtrlShiftMask = modCtrlMask .|. shiftMask
ctrlShiftMask = controlMask .|. shiftMask
ctrlAltMask = controlMask .|. altMask

cycleKbdLayoutKey = (mod1Mask .|. mod4Mask, xK_space) -- super+alt+space

quitWithWarning :: X ()
quitWithWarning = do
    let m = "confirm quit"
    s <- dmenu [m]
    when (m == s) (io exitSuccess)

myKeys :: [(String, X ())]
myKeys =
  [ ("M-S-z", spawn "xscreensaver-command -lock")
  , ("M-]",   spawn "firefox")
  , ("M-[",   spawn "emacsclient -c -a 'emacs'")
  , ("M-n",   spawn "~/.emacs.d/bin/org-capture")
  , ("M-p",   spawn "rofi -show drun")
  , ("M-C-p", spawn "rofi -show ssh")
  , ("M-S-p", spawn "rofi-pass")
  , ("M-v",   spawn "CM_LAUNCHER=rofi clipmenu")
  , ("M-c",   spawn "rofi -modi calc -show")
  , ("M-S-n", spawn "dunstctl set-paused toggle")
  , ("M-S-t", spawn "~/.bin/toggle-touchpad")
  , ("M-S-q", quitWithWarning)
  ]

myKeysX :: [((KeyMask, KeySym), X ())]
myKeysX = brightnessKeys ++ volumeKeys ++ screenshotKeys ++ miscKeys
  where
    brightnessKeys =
      [ ((0, xF86XK_MonBrightnessDown),             spawn $ backlightModify "-dec 10")
      , ((shiftMask, xF86XK_MonBrightnessDown),     spawn $ backlightModify "-dec 2")
      , ((ctrlShiftMask, xF86XK_MonBrightnessDown), spawn $ backlightModify "-dec 20")
      , ((controlMask, xF86XK_MonBrightnessDown),   spawn $ backlightModify "-set 5")
      , ((0, xF86XK_MonBrightnessUp),               spawn $ backlightModify "-inc 10")
      , ((shiftMask, xF86XK_MonBrightnessUp),       spawn $ backlightModify "-inc 2")
      , ((ctrlShiftMask, xF86XK_MonBrightnessUp),   spawn $ backlightModify "-inc 20")
      , ((controlMask, xF86XK_MonBrightnessUp),     spawn $ backlightModify "-set 100")
      ]
    volumeKeys =
      [ ((0, xF86XK_AudioRaiseVolume),             spawn $ volumeModify "set-sink-volume +10%")
      , ((shiftMask, xF86XK_AudioRaiseVolume),     spawn $ volumeModify "set-sink-volume +2%")
      , ((ctrlShiftMask, xF86XK_AudioRaiseVolume), spawn $ volumeModify "set-sink-volume +20%")
      , ((controlMask, xF86XK_AudioRaiseVolume),   spawn $ volumeModify "set-sink-volume 100%")
      , ((0, xF86XK_AudioLowerVolume),             spawn $ volumeModify "set-sink-volume -10%")
      , ((shiftMask, xF86XK_AudioLowerVolume),     spawn $ volumeModify "set-sink-volume -2%")
      , ((ctrlShiftMask, xF86XK_AudioLowerVolume), spawn $ volumeModify "set-sink-volume -20%")
      , ((controlMask, xF86XK_AudioLowerVolume),   spawn $ volumeModify "set-sink-volume 5%")
      , ((0, xF86XK_AudioMute),                    spawn $ volumeModify "set-sink-mute toggle")
      ]
    screenshotKeys =
      [ ((0, sunXK_Print_Screen),                       spawn "scrot -F 'Pictures/Screenshots/%Y%m%d%H%M%S.png'")
      , ((shiftMask, sunXK_Print_Screen),     unGrab *> spawn "sleep 0.2; scrot -s -F 'Pictures/Screenshots/%Y%m%d%H%M%S.png'")
      , ((altMask, sunXK_Print_Screen),                 spawn "scrot -u -F 'Pictures/Screenshots/%Y%m%d%H%M%S.png'")
      , ((controlMask, sunXK_Print_Screen),             spawn "scrot - | xclip -selection clipboard -target image/png")
      , ((ctrlShiftMask, sunXK_Print_Screen), unGrab *> spawn "sleep 0.2; scrot -s - | xclip -selection clipboard -target image/png")
      , ((ctrlAltMask, sunXK_Print_Screen),             spawn "scrot -u - | xclip -selection clipboard -target image/png")
      ]
    miscKeys =
      [ ((0, xF86XK_PowerDown),   spawn "systemctl suspend-then-hibernate")
      , (cycleKbdLayoutKey,       spawn "~/.bin/dunst/cycle-kbd-layout.sh")
      , ((mod1Mask, xK_Tab),      spawn "rofi -modi window -show")
      , ((myModeMask, xK_F6),     spawn "xprop >/tmp/xprop.txt; xdg-open /tmp/xprop.txt")
      ]

backlightModify :: String -> String
backlightModify args = "~/.bin/dunst/backlight-modify.sh " ++ args

volumeModify :: String -> String
volumeModify args = "~/.bin/dunst/volume-modify.sh " ++ args
