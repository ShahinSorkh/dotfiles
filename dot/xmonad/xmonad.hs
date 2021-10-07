module Main (main) where

import My.Keys
import My.Layouts
import My.StatusBar
import My.Hooks

import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig

main :: IO ()
main =
  xmonad
    . ewmhFullscreen
    . ewmh
    . withEasySB myStatusBar defToggleStrutsKey
    $ myConfig
  where
    myConfig =
        desktopConfig
          { modMask    = myModeMask -- Rebine Mod to the Super key
          , terminal   = "konsole" -- Use konsole as default terminal
          , layoutHook = myLayout -- Use custom layouts
          , manageHook = myManageHook -- Use custom manage hook
          }
        `additionalKeysP` myKeys
        `additionalKeys`  myKeysX
