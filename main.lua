local composer = require( "composer" )
display.setStatusBar( display.HiddenStatusBar )

local scene = composer.newScene()
H = display.pixelHeight--display.contentHeight;
W = display.pixelWidth--display.contentWidth;
SOX = display.screenOriginX;
SOY = display.screenOriginY;
cX = W/2;
cY = H/2;

score = 1; --global variable, which will keep the greatest record

composer.gotoScene( "scenes.menu", {effect = "fade", time = 700} )
