local composer = require( "composer" )


_data = require("lib.data")
--_data:wipe() -- wipes all saved data
--_data:save() -- saves data
--_data:update("skinCircle", 2) -- creates/updates some value
--_data:get("key") -- receives some value
_data:load()



display.setStatusBar( display.HiddenStatusBar )


local scene = composer.newScene()
H = display.pixelHeight--display.contentHeight;
W = display.pixelWidth--display.contentWidth;
SOX = display.screenOriginX;
SOY = display.screenOriginY;
cX = W/2;
cY = H/2;

score = 1;



composer.gotoScene( "scenes.menu", {effect = "fade", time = 700} )
