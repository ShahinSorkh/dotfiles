{-# LANGUAGE FlexibleContexts #-}

module My.StatusBar (myStatusBar, myWorkspaces) where

import qualified Data.Map as M
import Data.Maybe (fromJust)
import GHC.Base (Any)
import XMonad (KeyMask, KeySym, Layout, LayoutClass, Window, X, gets, WorkspaceId)
import XMonad.Config.Prime (windowset)
import XMonad.Core (XConfig)
import XMonad.Hooks.DynamicLog
  ( PP (..)
  , shorten
  , wrap
  , xmobarBorder
  , xmobarColor
  , xmobarRaw
  , xmobarStrip
  )
import XMonad.Hooks.ManageDocks (AvoidStruts)
import XMonad.Hooks.StatusBar
  ( StatusBarConfig
  , defToggleStrutsKey
  , dynamicEasySBs
  , statusBarProp
  , withEasySB
  )
import XMonad.Hooks.StatusBar.PP (xmobarPP)
import XMonad.Layout.Decoration (ModifiedLayout)
import qualified XMonad.StackSet as W
import XMonad.Util.Loggers (logTitles)

myWorkspaces :: [String]
myWorkspaces = [" www ", " code ", " chat ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]

myWorkspaceIndices :: M.Map Int String
myWorkspaceIndices = M.fromList $ zip [1..] myWorkspaces

workSpaceName :: WorkspaceId -> String
workSpaceName wsId = fromJust $ M.lookup (read wsId) myWorkspaceIndices

myStatusBar :: LayoutClass l Window => XConfig l -> XConfig (ModifiedLayout AvoidStruts l)
myStatusBar = withEasySB mainTop defToggleStrutsKey

mainTop :: StatusBarConfig
mainTop = statusBarProp "xmobar ~/.xmonad/xmobarrc" $ pure pp
  where
    pp =
      xmobarPP
        { ppCurrent = purple . wrapBottomBar . workSpaceName -- Current workspace
        , ppVisible = purple . workSpaceName -- Visible but not current workspace
        , ppHidden = blue . wrapTopBar . workSpaceName -- Hidden workspaces
        , ppHiddenNoWindows = blue . workSpaceName -- Hidden workspaces (no windows)
        , ppTitle = white . shorten 100 -- Title of active window
        , ppSep = sep -- Separator character
        , ppUrgent = orange . wrapExcl -- Urgent workspace
        }
    purple = xmobarColor "#c792ea" ""
    blue = xmobarColor "#82aaff" ""
    white = xmobarColor "#b3afc2" ""
    orange = xmobarColor "#c45500" ""
    sep = "<fc=#666666> <fn=1>|</fn> </fc>"
    wrapTopBar = wrap "<box type=Top width=2 mt=2 color=#82aaff>" "</box>"
    wrapBottomBar = wrap "<box type=Bottom width=2 mb=2 color=#c792ea>" "</box>"
    wrapExcl = wrap "!" "!"
