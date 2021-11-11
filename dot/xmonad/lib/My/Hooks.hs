module My.Hooks (myManageHook, myStartupHooks) where

import XMonad
  ( ManageHook,
    X,
    className,
    composeAll,
    doFloat,
    (-->),
    (=?),
  )
import XMonad.Hooks.ManageHelpers (isDialog)
import XMonad.Util.SpawnOnce (spawnOnOnce, spawnOnce)

myManageHook :: ManageHook
myManageHook =
  composeAll
    [ className =? "Gimp" --> doFloat,
      isDialog --> doFloat
    ]

myStartupHooks :: X ()
myStartupHooks = do
  spawnOnce "emacs --daemon"
  spawnOnce "cfw"

-- spawnOnOnce "workspace3" "slack"
-- spawnOnOnce "workspace3" "discord"
