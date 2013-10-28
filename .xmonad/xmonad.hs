import XMonad
import XMonad.Layout.Spacing
import XMonad.Hooks.DynamicLog  
import XMonad.Hooks.ManageDocks  

myLayout = tiled ||| Full
    where
        tiled = spacing 5 $ Tall nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 5/100

main = xmonad =<< xmobar defaultConfig
    { terminal    = "urxvt"
    , modMask     = mod1Mask
    , borderWidth = 2
    , layoutHook  = myLayout
    , manageHook  = manageDocks <+> manageHook defaultConfig
    }
