module Main (main) where

import My.Keys
import My.Layouts
import My.StatusBar
import My.Hooks

import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
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
          { modMask    = myModeMask
          , terminal   = "konsole"
          , layoutHook = myLayout
          , manageHook = myManageHook
          , logHook    = dynamicLog
          }
        `additionalKeysP` myKeys
        `additionalKeys`  myKeysX
