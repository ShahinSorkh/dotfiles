module My.Layouts (myLayout) where

import XMonad ( Default(def), Full (Full) )
import XMonad.Layout ()
import XMonad.Layout.DwmStyle
    ( shrinkText,
      Theme(fontName, activeColor, inactiveColor, activeBorderColor,
            inactiveBorderColor, activeTextColor, inactiveTextColor) )
import XMonad.Layout.Magnifier ()
import XMonad.Layout.Renamed (renamed, Rename (Replace))
import XMonad.Layout.WindowNavigation (windowNavigation)
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.Tabbed (addTabs)
import XMonad.Layout.ResizableTile (ResizableTall(ResizableTall))
import XMonad.Layout.SubLayouts (subLayout)
import XMonad.Layout.Simplest (Simplest(Simplest))
import XMonad.Layout.LimitWindows (limitWindows)
import XMonad.Layout.LayoutModifier (ModifiedLayout)
import XMonad.Layout.Spacing (Spacing, Border (Border), spacingRaw)
import XMonad.Hooks.ManageDocks (avoidStruts)
import XMonad.Actions.MouseResize (mouseResize)
import XMonad.Layout.ToggleLayouts (toggleLayouts)
import XMonad.Layout.WindowArranger (windowArrange)
import XMonad.Layout.MultiToggle ((??), mkToggle, EOT (EOT))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, NOBORDERS))
import XMonad.Layout.SimplestFloat (simplestFloat)
import XMonad.Layout.LayoutCombinators ((|||))

myFont :: String
myFont = "xft:SauceCodePro Nerd Font Mono:regular:size=9:antialias=true:hinting=true"

myTabTheme = def { fontName            = myFont
                 , activeColor         = "#46d9ff"
                 , inactiveColor       = "#313846"
                 , activeBorderColor   = "#46d9ff"
                 , inactiveBorderColor = "#282c34"
                 , activeTextColor     = "#282c34"
                 , inactiveTextColor   = "#d0d0d0"
                 }

mySpacing :: Integer -> l a -> ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

mySpacing' :: Integer -> l a -> ModifiedLayout Spacing l a
mySpacing' i = spacingRaw True (Border i i i i) True (Border i i i i) True

myLayout = avoidStruts $ mouseResize $ windowArrange $ toggleLayouts floats
           $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) defaultLayout
  where
    floats = renamed [Replace "floats"]
             $ smartBorders
             $ limitWindows 20 simplestFloat

defaultLayout = tall ||| full
  where
    tall = renamed [Replace "tall"]
        $ smartBorders
        $ windowNavigation
        $ addTabs shrinkText myTabTheme
        $ subLayout [] (smartBorders Simplest)
        $ limitWindows 12
        $ mySpacing 4
        $ ResizableTall 1 (3/100) (1/2) []
    full = renamed [Replace "full"]
           $ smartBorders
           $ mySpacing 4
           $ Full
