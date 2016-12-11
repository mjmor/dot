import XMonad
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.DynamicLog

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig
    
myConfig = defaultConfig
        {
        layoutHook = myLayout
        , terminal    = myTerminal
        -- , modMask     = myModMask
        , borderWidth = myBorderWidth
        , workspaces = myWorkspaces
        , logHook = fadeLogHook
        }



myTerminal    = "xterm"
-- key to use as mod key
-- myModMask     = modMask
myBorderWidth = 2

-- number and name of workspaces
myWorkspaces = ["1:main","2:chat","3:web/music","4:programming","5:media"]

-- LAYOUT CONFIGUTATIONS --
noBorderFullLayout = noBorders $ Full

borderdTileLayout = tiled
    where
        -- default tiling algorithm is two panes, use it here
        tiled = spacing 5 $ Tall nmaster delta ratio

        -- default number of windows in the master pane
        nmaster = 1

        -- default proportion of screen occupied by master pane
        ratio = 7/12

        -- Percent of screen to increment by when resizing panes
        delta = 3.5/120

myLayout = onWorkspace "5:media" noBorderFullLayout $ borderdTileLayout

------------------------------------------------

-- Fade inactive Windows

fadeLogHook :: X ()
fadeLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 0.8

-- XMobar settings

-- command to launch bar
myBar = "/usr/bin/xmobar /home/flounder/.xmobarrc"

--Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP 
    { ppCurrent = xmobarColor "yellow" "" . wrap "" "" 
      , ppOrder = \(ws:_:t:_) -> [ws,t]
      -- how to display spaces hidden because no window on them
      , ppHiddenNoWindows = xmobarColor "grey" ""
      , ppWsSep = "|"
    }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
