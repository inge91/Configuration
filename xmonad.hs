import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask
        , startupHook = myStartupHook
        }

myStartupHook = do
                spawn "xfce4-volumeicon"
                spawn "xfce4-power-manager"
                spawn "nm-applet"
                spawn "xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'"
                spawn "xset r rate 250 25"
                spawn "xset +dpms"
                spawn "xset dpms 0 0 300"
                spawn "synclient \"HorizTwoFingerScroll=1\""
                spawn "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent fakse --tint 0x000000 --height 12 &"
