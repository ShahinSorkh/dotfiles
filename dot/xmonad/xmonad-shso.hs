module Main (main) where

import My.Hooks (myManageHook, myStartupHooks)
import My.Keys
  ( myKeys
  , myKeysX
  , myModeMask
  )
import My.Layouts (myLayout)
import My.StatusBar (myStatusBar)
import XMonad
  ( XConfig
    ( focusedBorderColor
    , layoutHook
    , logHook
    , manageHook
    , modMask
    , normalBorderColor
    , startupHook
    , terminal
    )
  , xmonad
  )
import XMonad.Config.Desktop (desktopConfig)
import XMonad.Hooks.DynamicLog (dynamicLog)
import XMonad.Hooks.EwmhDesktops (ewmh, ewmhFullscreen)
import XMonad.Util.EZConfig (additionalKeys, additionalKeysP)
import XMonad.Util.SpawnOnce (spawnOnOnce, spawnOnce)

main :: IO ()
main =
  xmonad
    . ewmhFullscreen
    . ewmh
    . myStatusBar
    $ myConfig
  where
    myConfig =
      desktopConfig
        { modMask = myModeMask
        , terminal = "konsole"
        , layoutHook = myLayout
        , manageHook = myManageHook
        , logHook = dynamicLog
        , normalBorderColor = "#282c34"
        , focusedBorderColor = "#46d9ff"
        , startupHook = do
            myStartupHooks
        }
        `additionalKeysP` myKeys
        `additionalKeys` myKeysX
