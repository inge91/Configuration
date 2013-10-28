import XMonad
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Hooks.DynamicLog  
import XMonad.Hooks.ManageDocks  

myLayout = tiled ||| noBorders Full
    where
        tiled = spacing 5 $ Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 5/100

myBar = "xmobar"
myPP = xmobarPP
myToggleStruts XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

main = xmonad =<< statusBar myBar myPP myToggleStruts defaultConfig
    { terminal           = "urxvt"
    , modMask            = mod4Mask
    , borderWidth        = 2
    , layoutHook         = myLayout
    , manageHook         = manageDocks <+> manageHook defaultConfig
    , normalBorderColor  = "#333333"
    , focusedBorderColor = "#8542FF"
    }
