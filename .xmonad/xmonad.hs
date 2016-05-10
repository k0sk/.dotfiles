import System.Posix.Env (getEnv)
import System.IO
import System.Directory
import Data.Maybe (maybe)
import Graphics.X11.ExtraTypes.XF86

import XMonad

import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce

import XMonad.Layout
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
--import XMonad.Layout.DragPane          -- see only two window
import XMonad.Layout.Grid
-- import XMonad.Layout.SimplestFloat
import XMonad.Layout.ResizableTile     -- Resizable Horizontal border
import XMonad.Layout.Spacing           -- this makes smart space around windows
import XMonad.Layout.ToggleLayouts
-- import XMonad.Layout.Magnifier         -- this makes window bigger

import XMonad.Hooks.InsertPosition
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.SetWMName

import XMonad.Prompt
import XMonad.Prompt.Shell

import XMonad.Util.EZConfig
import XMonad.Util.WorkspaceCompare
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.SpawnOnce

import XMonad.Actions.CycleWS 
import XMonad.Actions.FloatKeys
import XMonad.Actions.CopyWindow

import qualified XMonad.StackSet as W -- to shift and float windows

-- basic configuration
--

myModMask     = mod4Mask -- use the Windows key as mod
myBorderWidth = 2        -- set window border size
myTerminal    = "urxvt"  -- preferred terminal emulator

myWorkspaces = ["1", "2", "3", "4"]

myKeys = [
	  ("M-C-<R>", withFocused (keysMoveWindow (2,0)))
	, ("M-C-<L>", withFocused (keysMoveWindow (-2,0)))
	, ("M-C-<U>", withFocused (keysMoveWindow (0,-2)))
	, ("M-C-<D>", withFocused (keysMoveWindow (0,2)))
	, ("M-S-j", windows W.swapDown)
	, ("M-S-k", windows W.swapUp)
	, ("M-S-m", windows W.shiftMaster)
        , ("M-n", moveTo Next NonEmptyWS)
        , ("M-p", moveTo Prev NonEmptyWS)
        , ("M-S-p", shiftTo Prev EmptyWS)
	, ("M-c", kill1)
	, ("M-f", sendMessage ToggleLayout)
	, ("M-/", shellPrompt myXPConfig)
	-- spawn commands
	, ("M1-C-l", spawn "xscreensaver-command -lock")
	, ("M-w", spawn "chromium")
    ]

myXPConfig = defaultXPConfig {
	font = "xft:Source Code Pro:size=10"
	, bgColor = "#222222"
	, fgColor = "#999999"
	, promptBorderWidth = 1
	, position = Top
	, alwaysHighlight = True
	, height = 32
	, historySize = 15
	}

colorBlue      = "#857da9"
colorGreen     = "#88b986"
colorGray      = "#676767"
colorWhite     = "#d3d7cf"
colorGrayAlt   = "#313131"
colorNormalbg  = "#1a1e1b"

myNormalBorderColor = colorGray
myFocusedBorderColor = colorGreen

-- gapwidth
gapwidth  = 4
gapwidthU = 24
gapwidthD = 4
gapwidthL = 4
gapwidthR = 4

--
-- main function (no configuration stored there)
--
main :: IO ()
main = do
    session <- getEnv "DESKTOP_SESSION"
    let defDesktopConfig = maybe desktopConfig desktop session
        myDesktopConfig = defDesktopConfig
            { modMask     = myModMask
            , terminal = myTerminal
            , borderWidth = myBorderWidth
            , normalBorderColor = myNormalBorderColor
            , focusedBorderColor = myFocusedBorderColor
            , workspaces = myWorkspaces
            , startupHook = myCommonStartupHook
            , layoutHook  = myLayoutHook
            , manageHook  = myManageHook <+> manageHook defDesktopConfig <+> manageDocks <+> insertPosition Below Newer
            } `additionalKeysP` myKeys
    -- when running standalone (no KDE), try to spawn xmobar (if installed)
    xmobarInstalled <- doesFileExist "/usr/bin/xmobar"
    if xmobarInstalled
        then do mproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar.hs"
                xmonad $ myDesktopConfig
                        { logHook  = myLogHook mproc
			  , startupHook = myStartupHook <+> myCommonStartupHook
                        } -- `additionalKeys` myStandAloneKeys
        else do xmonad myDesktopConfig


myManageHook = myManageHookByApps <+> myManageHookByGroups

myManageHookByApps = composeAll
    [
	isFullscreen --> doFullFloat
    ]

myManageHookByGroups = composeAll . concat $
    [
    [ className   =? c --> doFloat           | c <- myFloats]
    -- , [ title       =? t --> doFloat           | t <- myOtherFloats]
    , [ className   =? c --> doCenterFloat     | c <- myCenterFloats]
    -- , [ className   =? c --> doF (W.shift "2") | c <- webBrowsers]
    ]
  where
        myFloats      = ["Plasma-desktop", "plasmashell", "krunner"]
        -- myOtherFloats = []
	myCenterFloats = ["feh"]
        -- webBrowsers       = ["chromium"]

myCommonStartupHook = do
	setWMName "LG3D"

myStartupHook = do
	spawnOnce "feh --bg-center ~/pics/geo.png"
	spawnOnce "fcitx"

-- Handle Window behaveior
myLayoutHook = smartBorders $ avoidStruts $ spacing gapwidth $
           gaps [(U, gapwidthU),(D, gapwidthD),(L, gapwidthL),(R, gapwidthR)] $ coreLayoutHook

coreLayoutHook = tiled ||| Mirror tiled ||| Full ||| Grid
             where
                    -- default tiling algorithm partitions the screen into two panes
                    tiled   =  ResizableTall nmaster delta ratio []
                    -- The default number of windows in the master pane
                    nmaster = 1
                    -- Default proportion of screen occupied by master pane
                    ratio   = 3/5
                    -- Percent of screen to increment by when resizing panes
                    delta   = 2/100

-- log hook (for xmobar)
myLogHook xmproc = dynamicLogWithPP $ wsPP { ppOutput = hPutStrLn xmproc }

wsPP = xmobarPP { ppOrder               = \(ws:l:t:_)   -> [ws,t]
                , ppCurrent             = xmobarColor   colorGreen       colorNormalbg
                , ppUrgent              = xmobarColor   colorWhite       colorNormalbg
                , ppVisible             = xmobarColor   colorWhite       colorNormalbg
                , ppHidden              = xmobarColor   colorWhite       colorNormalbg
                , ppHiddenNoWindows     = xmobarColor   colorGray        colorNormalbg
                , ppTitle               = xmobarColor   colorWhite       colorNormalbg
                , ppWsSep               = " "
                , ppSep                 = "  "
                }


-- desktop :: DESKTOP_SESSION -> desktop_configuration
desktop "gnome"         = gnomeConfig
desktop "xmonad-gnome"  = gnomeConfig
desktop "kde"           = kde4Config
desktop "kde-plasma"    = kde4Config
desktop "plasma"        = kde4Config
desktop "xfce"          = xfceConfig
desktop _               = desktopConfig

