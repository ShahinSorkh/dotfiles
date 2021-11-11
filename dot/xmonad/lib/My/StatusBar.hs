{-# LANGUAGE FlexibleContexts #-}

module My.StatusBar (myStatusBar) where

import XMonad
  ( Default (def),
    KeyMask,
    KeySym,
    Layout,
    LayoutClass,
    Window,
    (<+>),
  )
import XMonad.Core (XConfig)
import XMonad.Hooks.DynamicLog
  ( PP
      ( ppCurrent,
        ppExtras,
        ppHidden,
        ppHiddenNoWindows,
        ppOrder,
        ppSep,
        ppTitleSanitize,
        ppUrgent
      ),
    shorten,
    wrap,
    xmobarBorder,
    xmobarColor,
    xmobarRaw,
    xmobarStrip,
  )
import XMonad.Hooks.ManageDocks (AvoidStruts)
import XMonad.Hooks.StatusBar
  ( StatusBarConfig,
    defToggleStrutsKey,
    dynamicEasySBs,
    statusBarProp,
    withEasySB,
  )
import XMonad.Layout.Decoration (ModifiedLayout)
import XMonad.Util.Loggers (logTitles)

myStatusBar :: LayoutClass l Window => XConfig l -> XConfig (ModifiedLayout AvoidStruts l)
myStatusBar = withEasySB (mainTop <+> mainBottom) defToggleStrutsKey

mainTop :: StatusBarConfig
mainTop = statusBarProp "xmobar ~/.xmonad/xmobar/mainTop" $ pure mainTopPP

mainTopPP :: PP
mainTopPP =
  def
    { ppSep = magenta "",
      ppTitleSanitize = xmobarStrip,
      ppCurrent = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2,
      ppHidden = white . wrap " " "",
      ppHiddenNoWindows = lowWhite . wrap " " "",
      ppUrgent = red . wrap (yellow "!") (yellow "!"),
      ppOrder = \[_, _, _, wins] -> [wins],
      ppExtras = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused = wrap (white "[") (white "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue . ppWindow

    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta = xmobarColor "#ff79c6" ""
    blue = xmobarColor "#bd93f9" ""
    white = xmobarColor "#f8f8f2" ""
    yellow = xmobarColor "#f1fa8c" ""
    red = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#aaaaaa" ""

mainBottom :: StatusBarConfig
mainBottom = statusBarProp "xmobar ~/.xmonad/xmobar/mainBottom" $ pure mainBottomPP

mainBottomPP :: PP
mainBottomPP =
  def
    { ppSep = magenta " • ",
      ppTitleSanitize = xmobarStrip,
      ppCurrent = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2,
      ppHidden = white . wrap " " "",
      ppHiddenNoWindows = lowWhite . wrap " " "",
      ppUrgent = red . wrap (yellow "!") (yellow "!"),
      ppOrder = \[ws, l, _] -> [ws, l],
      ppExtras = []
    }
  where
    lowWhite, magenta, red, white, yellow :: String -> String
    magenta = xmobarColor "#ff79c6" ""
    white = xmobarColor "#f8f8f2" ""
    yellow = xmobarColor "#f1fa8c" ""
    red = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#aaaaaa" ""
