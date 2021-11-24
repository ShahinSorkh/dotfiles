module My.Pass (passPrompt', passGeneratePrompt', passRemovePrompt', passEditPrompt') where

import System.Directory (getDirectoryContents)
import System.Environment (getEnv)
import System.Exit (exitSuccess)
import System.FilePath (takeBaseName, combine)
import XMonad (X, spawn)
import XMonad.Prompt.Pass (passPrompt, passRemovePrompt, passEditPrompt, passGenerateAndCopyPrompt)
import XMonad.Prompt.AppLauncher (XPrompt)
import XMonad.Prompt.ConfirmPrompt (XPrompt(showXPrompt))
import XMonad.Prompt
  ( def
  , getNextCompletion
  , XPrompt(commandToComplete, nextCompletion)
  , XPConfig (..)
  , XPPosition (..)
  )

data Pass = Pass
instance XPrompt Pass where
  showXPrompt          _ = "Pass: "
  commandToComplete  _ c = c
  nextCompletion       _ = getNextCompletion

promptConfig =
  def
    { font = "xft:Ubuntu:weight=bold:pixelsize=11:antialias=true:hinting=true"
    , borderColor = "#282c34"
    , fgColor = "#b3afc2"
    , fgHLight = "#82aaff"
    , bgColor = "#282c34"
    , bgHLight = "#282c34"
    , height = 24
    , position = Top
    }

passPrompt' = passPrompt promptConfig
passEditPrompt' = passEditPrompt promptConfig
passGeneratePrompt' = passGenerateAndCopyPrompt promptConfig
passRemovePrompt' = passRemovePrompt promptConfig
