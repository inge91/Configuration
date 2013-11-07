import qualified Data.Map as M

import XMonad

import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ResizableTile

import XMonad.Hooks.DynamicLog  
import XMonad.Hooks.ManageDocks  

myLayout = smartSpacing 7 (tiled ||| threecol) ||| noBorders Full
    where
        tiled = ResizableTall 1 (3/100) (1/2) []
        threecol = ThreeColMid 1 (3/100) (1/2)

myBar = "xmobar"
myPP = xmobarPP
    { ppCurrent = xmobarColor "#9B64FB" "" . wrap "[" "]"
    , ppTitle   = xmobarColor "#A0CF5D" "" . wrap "" ""
}
myToggleStruts XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

main = xmonad =<< statusBar myBar myPP myToggleStruts defaultConfig
    { terminal           = "xcwd | xargs urxvt -cd"
    , modMask            = mod4Mask
    , borderWidth        = 2
    , layoutHook         = myLayout
    , manageHook         = manageDocks <+> manageHook defaultConfig
    , normalBorderColor  = "#EEEEEE"
    , focusedBorderColor = "#FF0000"
    , keys               = myKeys <+> keys defaultConfig
    }


myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList
    [ ((modm,               xK_z), sendMessage MirrorShrink)
    , ((modm,               xK_a), sendMessage MirrorExpand)
    ]
