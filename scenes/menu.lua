-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local CBE = require("CBE.CBE")
local scene = composer.newScene()
local widget = require( "widget" )

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------



--Create flying yellow baloons in the background
--***********↓↓↓↓↓↓↓↓↓↓******************

local balloonsBg = CBE.newVent({
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
balloonsBg:start()

--************↑↑↑↑↑↑↑↑↑↑************************
--Create flying yellow baloons in the background


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

  local bgColor = display.newRect( menuGroup, cX, cY, W-SOX*2, H-SOY*2);
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

  bgColor:setFillColor(gradients[math.random(1,4)])


--*************↑↑↑↑↑↑↑↑↑↑**************************
--Change background of scene everytime when load it

  menuGroup:insert(balloonsBg)



--A bit of design...
--***************↓↓↓↓↓↓↓↓↓↓**********************

  local bgImage = display.newImage("menu/menuBg.png",cX,cY)
  sceneGroup:insert(bgImage)
  bgImage.alpha = 1
  bgImage.xScale = 0.447
  bgImage.yScale = 0.447

  local scoreTable = display.newRoundedRect(cX-35,cY+234, 210,80,10)
  scoreTable:setFillColor(0,0,0, 0.15)
  sceneGroup:insert(scoreTable)

--*************↑↑↑↑↑↑↑↑↑↑**************************
--A bit of design...


--***********Create two buttons******************
--***************↓↓↓↓↓↓↓↓↓↓**********************

  local function giftButtonFunc( event )

      if ( "ended" == event.phase ) then

      end
  end


  local giftButton = widget.newButton(
      {
          left = 110,
          top = 310,
          defaultFile = "menu/giftBig.png",
          overFile = "menu/giftSmall.png",
          onEvent = giftButtonFunc,

      }
  )
  giftButton.x = cX + 117
  giftButton.y = cY + 235
  giftButton.xScale = 0.28
  giftButton.yScale = 0.28
  sceneGroup:insert(giftButton)


  local function playButtonFunc( event )

      if ( "ended" == event.phase ) then
         composer.gotoScene( "scenes.game" , {effect = "fade", time = 300} );
      end
  end


  local playButton = widget.newButton(
      {
          width = 520,
          height = 340,
          defaultFile = "menu/playButton.png",
          overFile = "menu/playButtonSmall.png",
          onEvent = playButtonFunc,

      }
  )
  playButton.x = cX - 30
  playButton.y = cY + 130
  playButton.xScale = 0.55
  playButton.yScale = 0.55
  sceneGroup:insert(playButton)


--*************↑↑↑↑↑↑↑↑↑↑**************************
--***********Create two buttons******************





--********Displaying a record with pictures******
--***************↓↓↓↓↓↓↓↓↓↓**********************


  local scoreMenu = score;
  local a = 0
  local number = {}

  if scoreMenu == 0 then
      local zero = display.newImage("numbers/0.png", cX-8,cY-100)
      zero.x = cX + 38
      zero.y = cY + 243
      zero.alpha = 0.8
      zero.xScale = 0.1
      zero.yScale = 0.1
      sceneGroup:insert(zero)
  else

      while scoreMenu > 0.1 do

        local lastNumber = scoreMenu%10
        a = a + 1;
        number[a] = display.newImage("numbers/"..lastNumber..".png", cX-8,cY-100)
        number[a].x = number[a].x - a*33 + 80
        number[a].y = cY + 240
        number[a].alpha = 0.8
        number[a].xScale = 0.1
        number[a].yScale = 0.1
        sceneGroup:insert(number[a])
        scoreMenu = scoreMenu/10 - (scoreMenu%10/10)

      end

  end

--*************↑↑↑↑↑↑↑↑↑↑**************************
--********Displaying a record with pictures******





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
        balloonsBg:destroy()
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
