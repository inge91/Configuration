import XMonad

import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Grid

import XMonad.Hooks.DynamicLog  
import XMonad.Hooks.ManageDocks  

myLayout = spacing 5 (tiled ||| Grid) ||| noBorders Full
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 5/100

myBar = "xmobar"
myPP = xmobarPP
    { ppCurrent = xmobarColor "#9B64FB" "" . wrap "[" "]"
    , ppTitle   = xmobarColor "#A0CF5D" "" . wrap "" ""
}
myToggleStruts XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

main = xmonad =<< statusBar myBar myPP myToggleStruts defaultConfig
    { terminal           = "urxvt"
    , modMask            = mod1Mask
    , borderWidth        = 2
    , layoutHook         = myLayout
    , manageHook         = manageDocks <+> manageHook defaultConfig
    , normalBorderColor  = "#151515"
    , focusedBorderColor = "#9B64FB"
    }
