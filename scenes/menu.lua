-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
H = display.contentHeight;
W = display.contentWidth;

cX = W/2;
cY = H/2;

local composer = require( "composer" )
local CBE = require("CBE.CBE")
local scene = composer.newScene()
local widget = require( "widget" )
local physics = require("physics")
physics.start()
physics.setDrawMode( "hybrid" )

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------


--****************************************
--Flying yellow baloons in the background
local vent = CBE.newVent({
    title = "sparks",
    positionType = "inRadius",
    emitX = cX, emitY = cY+20,
    build = function() local size = math.random(10, 20) return display.newImageRect("sBalloons/yellow.png", 30, 40) end,
    color = {{1}, {0.9, 0.9, 1}},
    emitDelay = 3000,
    perEmit = 2,
    inTime = 1000,
    outTime = 10000,
    startAlpha = 0,
    physics = {
      velocity = 0.3,
      gravityY = -0.003
    }

})
vent:start()
--Flying yellow baloons in the background
--****************************************

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

  local sceneGroup = self.view

  local menuGroup = display.newGroup();
  sceneGroup:insert(menuGroup);



--Change background of scene everytime when load it
--***************↓↓↓↓↓↓↓↓↓↓**********************

  local bg = display.newRect( menuGroup, cX, cY, W-SOX*2, H-SOY*2);
  local gradient1 = {
    type="gradient",
    color1={ 0.4, 0.2, 0.9 }, color2={ 0.9, 0.8, 0.8 }, direction="down"
    }

  local gradient2 = {
    type="gradient",
    color1={ 0.2, 1, 0.9 }, color2={ 0.9, 0.1, 0.8 }, direction="down"
    }

  local gradient3 = {
    type="gradient",
    color1={ 0.2, 1, 0.9 }, color2={ 0.1, 0.1, 0.1 }, direction="down"
    }

  local gradient4 = {
    type="gradient",
    color1={ 1, 0.4, 0.3 }, color2={ 0.3, 0.9, 0.5 }, direction="down"
    }

  local gradients = {gradient1,gradient2, gradient3, gradient4};

  bg:setFillColor(gradients[math.random(1,4)])


--*************↑↑↑↑↑↑↑↑↑↑**************************
--Change background of scene everytime when load it

menuGroup:insert(vent)







    ---ЗАМЕНИТЬ НА ОДНУ КАРТИНКУ


    local fence = display.newImage("menu/fence.png", cX+213,cY-100)
    fence.xScale = 0.13
    fence.yScale = 0.13
    menuGroup:insert(fence)

    local road = display.newImage("menu/road.png", cX,cY+145)
    road.xScale = 0.13
    road.yScale = 0.13
    menuGroup:insert(road)

    local road = display.newImage("menu/road.png", cX,cY+265)
    road.xScale = 0.13
    road.yScale = 0.13
    menuGroup:insert(road)

    local seller = display.newImage("menu/seller.png", cX-30,cY-100)
    seller.xScale = 0.13
    seller.yScale = 0.13
    menuGroup:insert(seller)

    local He = display.newImage("menu/He.png", cX+100,cY-5)
    He.xScale = 0.11
    He.yScale = 0.11
    menuGroup:insert(He)

    local Pb = display.newImage("menu/Pb.png", cX+56,cY+5)
    Pb.xScale = 0.11
    Pb.yScale = 0.11
    menuGroup:insert(Pb)

    local Ar = display.newImage("menu/Ar.png", cX+140,cY-24)
    Ar.xScale = 0.11
    Ar.yScale = 0.11
    menuGroup:insert(Ar)


    ---ЗАМЕНИТЬ НА ОДНУ КАРТИНКУ






local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then

    end
end


local gift = widget.newButton(
    {
        left = 110,
        top = 310,
        defaultFile = "menu/giftBig.png",
        overFile = "menu/giftSmall.png",
        onEvent = handleButtonEvent,

    }
)
gift.xScale = 0.28
gift.yScale = 0.28
sceneGroup:insert(gift)


local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
       composer.gotoScene( "scenes.game" , {effect = "fade", time = 300} );
    end
end


local play = widget.newButton(
    {
        sheetContentWidth = 80,
        left = -155,
        top = 165,
        defaultFile = "menu/playButton.png",
        overFile = "menu/playButtonSmall.png",
        onEvent = handleButtonEvent,

    }
)
play.xScale = 0.55
play.yScale = 0.55
sceneGroup:insert(play)

local scoreTable = display.newRoundedRect(cX-35,cY+234, 210,80,10)
scoreTable:setFillColor(0,0,0, 0.15)
sceneGroup:insert(scoreTable)

local cup = display.newImage("menu/cup.png",cX-110,cY+234)
sceneGroup:insert(cup)
cup.alpha = 0.8
cup.xScale = 0.15
cup.yScale = 0.15


local whiteDot = display.newRoundedRect(cX-87.1,cY+235.02,7,6.5,5)
whiteDot:setFillColor(1,1,1)
sceneGroup:insert(whiteDot)

local blueDot = display.newRoundedRect(cX-87,cY+235,5,5,5)
blueDot:setFillColor(0.65,0.7,1)
sceneGroup:insert(blueDot)


local whiteDot = display.newRoundedRect(cX-87.1,cY+245.02,7,6.5,5)
whiteDot:setFillColor(1,1,1)
sceneGroup:insert(whiteDot)

local blueDot = display.newRoundedRect(cX-87,cY+245,5,5,5)
blueDot:setFillColor(0.65,0.7,1)
sceneGroup:insert(blueDot)

local scoreMenu = score;
local scoreOpposite = 0;
local a = 0
local number = {}

if scoreMenu == 1 then

  zero = display.newImage("numbers/0.png", cX-8,cY-100)
  zero.x = cup.x + 53
  zero.y = cY + 243
  zero.alpha = 0.8
  zero.xScale = 0.1
  zero.yScale = 0.1
  sceneGroup:insert(zero)

else


while scoreMenu > 0.1 do
local lastNumber = scoreMenu%10

scoreOpposite = scoreOpposite + lastNumber;
scoreOpposite = scoreOpposite * 10;
scoreMenu = scoreMenu/10 - (scoreMenu%10/10)
end --]]

scoreOpposite = scoreOpposite / 10;

while scoreOpposite > 0.1 do
  local lastNumber = scoreOpposite%10
  a = a + 1;
  number[a] = display.newImage("numbers/"..lastNumber..".png", cX-8,cY-100)
  number[a].x = number[a].x + a*33 - 80
  number[a].y = cY + 240
  number[a].alpha = 0.8
  number[a].xScale = 0.1
  number[a].yScale = 0.1
  sceneGroup:insert(number[a])
  scoreOpposite = scoreOpposite/10 - (scoreOpposite%10/10)
end

  if (score % 10 == 0) then
    zero = display.newImage("numbers/0.png", cX-8,cY-100)
    zero.x = number[a].x + 33
    zero.y = cY + 240
    zero.alpha = 0.8
    zero.xScale = 0.1
    zero.yScale = 0.1
    sceneGroup:insert(zero)
  end

end









end




-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        vent:destroy()
        composer.removeScene("scenes.menu")

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
