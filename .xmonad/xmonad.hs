import qualified Data.Map as M

import XMonad

import XMonad.Layout.NoBorders
import XMonad.Layout.Grid
import XMonad.Layout.ResizableTile

import XMonad.Actions.WorkspaceNames

import XMonad.Hooks.DynamicLog  
import XMonad.Hooks.ManageDocks  

myLayout = smartBorders $ tiled ||| Grid ||| Full
    where
        tiled = ResizableTall 1 (3/100) (1/2) []

main = xmonad =<< xmobar defaultConfig
    { terminal           = "xcwd | xargs urxvt -cd"
    , modMask            = mod4Mask
    , borderWidth        = 4
    , layoutHook         = myLayout
    , manageHook         = manageDocks <+> manageHook defaultConfig
    , normalBorderColor  = "#707070"
    , focusedBorderColor = "#46a4ff"
    , keys               = myKeys <+> keys defaultConfig
    }


myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList
    [ ((modm,               xK_z), sendMessage MirrorShrink)
    , ((modm,               xK_a), sendMessage MirrorExpand)
    ]
