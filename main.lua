local composer = require( "composer" )
display.setStatusBar( display.HiddenStatusBar )

local scene = composer.newScene()
H = display.contentHeight;
W = display.contentWidth;
SOX = display.screenOriginX;
SOY = display.screenOriginY;
cX = W/2;
cY = H/2;

score = 0; --global variable, which will keep the greatest record

composer.gotoScene( "scenes.menu", {effect = "fade", time = 700} )
