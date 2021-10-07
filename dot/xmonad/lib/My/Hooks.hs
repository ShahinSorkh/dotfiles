module My.Hooks (myManageHook) where

import XMonad
import XMonad.Hooks.ManageHelpers

myManageHook :: ManageHook
myManageHook = composeAll [ className =? "Gimp" --> doFloat
                          , isDialog --> doFloat
                          ]
