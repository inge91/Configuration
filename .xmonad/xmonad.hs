import XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.LayoutHints
import XMonad.Hooks.DynamicLog  
import XMonad.Hooks.ManageDocks  

myLayout = layoutHints tiled ||| noBorders Full
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 5/100

myBar = "xmobar"
myPP = xmobarPP
    { ppCurrent = xmobarColor "#96CBFE" "" . wrap "[" "]"
    , ppTitle   = xmobarColor "#A8FF60" "" . wrap "" ""
}
myToggleStruts XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

main = xmonad =<< statusBar myBar myPP myToggleStruts defaultConfig
    { terminal           = "urxvt"
    , modMask            = mod4Mask
    , borderWidth        = 2
    , layoutHook         = myLayout
    , manageHook         = manageDocks <+> manageHook defaultConfig
    , normalBorderColor  = "#7C7C7C"
    , focusedBorderColor = "#FF73FD"
    }
