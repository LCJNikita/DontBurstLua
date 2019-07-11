
-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()
local CBE = require("CBE.CBE")
local physics = require("physics")
physics.start()
physics.setGravity( 0, -1 )
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )


  local sceneGroup = self.view
  local bg = display.newRect(sceneGroup, cX, cY, W-SOX*2, H-SOY*2)


--Change background of scene everytime when load it
--***************↓↓↓↓↓↓↓↓↓↓**********************

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


--Change ballon (red or blue) of scene everytime when load it
--***************↓↓↓↓↓↓↓↓↓↓**********************
  local randBallon = math.random(1,2)

  if randBallon == 1 then
    local ironHelium = display.newImage("ironHelium/ballonRed.png",cX-38,cY+235)
    ironHelium.alpha = 1
    ironHelium.rotation = 90
    ironHelium.xScale = 0.18
    ironHelium.yScale = 0.18
    sceneGroup:insert(ironHelium)
  elseif randBallon == 2 then
    local ironHelium = display.newImage("ironHelium/ballonBlue.png",cX-38,cY+235)
    ironHelium.alpha = 1
    ironHelium.rotation = 90
    ironHelium.xScale = 0.18
    ironHelium.yScale = 0.18
    sceneGroup:insert(ironHelium)
  end

--*************↑↑↑↑↑↑↑↑↑↑**************************
--Change ballon (red or blue) of scene everytime when load it




--Options of hose animation
--*******↓↓↓↓↓↓↓↓↓↓********

  local sheetOptions =
  {
      width = 296,
      height = 532,
      numFrames = 8
  }

       local sheet_hose = graphics.newImageSheet( "hoseAnimation.png", sheetOptions )
       local sequences_hose = {

                { name = "normalRun",
                  start = 1,
                  count = 8,
                  time = 720,
                  loopCount = 0
              },

     }
  local animationOfHose = display.newSprite( sheet_hose, sequences_hose )
  animationOfHose.x=cX-1;
  animationOfHose.y=cY+13;
  sceneGroup:insert(animationOfHose)

--*******↑↑↑↑↑↑↑↑↑↑********
--Options of hose animation


--Start timer using 3 Runtimes working like chain reaction
--**********************↓↓↓↓↓↓↓↓↓↓************************

local paintOne = {
    type = "gradient",
    color1 = { 0.7, 0, 0.1 },
    color2 = { 0, 0, 0.5 },
    direction = "down"
}

local paintTwo = {
    type = "gradient",
    color1 = { 0, 0.8, 0.1 },
    color2 = { 0, 0, 0.5 },
    direction = "down"
}

local paintThree = {
    type = "gradient",
    color1 = { 0.3, 0.5, 0.1 },
    color2 = { 1, 0.3, 0 },
    direction = "down"
}

  local one = display.newText("1",cX,cY)
  one.fill = paintOne
  one.size = 150
  sceneGroup:insert(one)

  local two = display.newText("2",cX,cY)
  two.size = 1
  two.fill = paintTwo
  sceneGroup:insert(two)

  local three = display.newText("3",cX,cY)
  three.fill = paintThree
  three.size = 1
  sceneGroup:insert(three)

  local function increaseNumber(num)
    num.size = num.size + 5
  end

  function increaseThree()
    increaseNumber(three)
    if three.size > 370 then
      three.alpha = 0
      Runtime:removeEventListener( "enterFrame", increaseThree )
      animationOfHose:play();
    end
  end

  function increaseTwo()
    increaseNumber(two)
    if two.size > 370 then
      two.alpha = 0
      three.size = 200
      Runtime:addEventListener( "enterFrame", increaseThree )
      Runtime:removeEventListener( "enterFrame", increaseTwo )
    end
  end

  function increaseOne()
    increaseNumber(one)
    if one.size > 350 then
      one.alpha = 0
      two.size = 200
      Runtime:addEventListener( "enterFrame", increaseTwo )
      Runtime:removeEventListener( "enterFrame", increaseOne )
    end
  end
  Runtime:addEventListener( "enterFrame", increaseOne )


--********************↑↑↑↑↑↑↑↑↑↑**************************
--Start timer using 3 Runtimes working like chain reaction


--Confetti animation (It works every 5 successful clicks)
--********************↓↓↓↓↓↓↓↓↓↓************************

local confetti = CBE.newVent({
  title = "confetti",
  positionType = "alongLine",
  emitX = 0, emitY = 0,
  point1 = {0, -100},
  point2 = {H-100, -10},
  build = function() return display.newRect(0, 0, math.random(10, 15), math.random(10, 15)) end,
  color = {{1, 0, 0}, {0, 0, 1}, {1, 1, 0}, {0, 1, 0}},
  emitDelay = 100,
  perEmit = 2,
  inTime = 100,
  lifeTime = 1900,
  outTime = 50,
  startAlpha = 0,
  rotateTowardVel = true,
  physics = {
    velocity = 5,
    angles = {{200, 340}},
    gravityY = 0.1
  }
})

--****************↑↑↑↑↑↑↑↑↑↑↑↑**************************
--Confetti animation (It works every 5 successful clicks)


--Options of bursting ball (It works when you lose)
--********************↓↓↓↓↓↓↓↓↓↓*******************
  local sheetOptionsBurst =
  {
      width = 213 ,
      height = 204,
      numFrames = 5
  }

  local sheet_burst_balloon = graphics.newImageSheet( "sBalloons/baloonAnimation.png", sheetOptionsBurst )

  local sequences_burst_balloon = {
    -- consecutive frames sequence
    {
        name = "fastRun",
        frames = { 5,4,3,2,1},
        count = 1,
        time = 400,
        loopCount = 1
    }
  }


  local burstBalloon = display.newSprite( sheet_burst_balloon, sequences_burst_balloon )
  burstBalloon.x = cX
  burstBalloon.y = cY-20
  burstBalloon.alpha = 0
  sceneGroup:insert(burstBalloon)

--**************↑↑↑↑↑↑↑↑↑↑↑↑**********************
--Options of bursting ball (It works when you lose)






--Create some variables
--*****↓↓↓↓↓↓↓↓↓↓******

  local circleSkin = ""
  local rectSkin = ""
  local starSkin = ""
  local flowerSkin = ""


--Bottom dotted line
  local ballExG = display.newImage("sBalloons/circleLimit.png",cX,cY-10)
  ballExG.alpha = 0.5
  ballExG.xScale = 3.1
  ballExG.yScale = 3.1
  sceneGroup:insert(ballExG)
--Bottom dotted line

--Top dotted line
  local ballExR = display.newImage("sBalloons/circleLimit.png",cX,cY-10)
  ballExR:setFillColor(0.9,0.1,0.1)
  ballExR.alpha = 0.5
  ballExR.xScale = 2.5
  ballExR.yScale = 2.5
  sceneGroup:insert(ballExR)
--Top dotted line


  local colors = {}
  colors[1] = "Blue"
  colors[2] = "Red"
  colors[3] = "Green"
  colors[4] = "Yellow"
  colors[5] = "Orange"
  colors[6] = "Purple"

  local figure = {}
  figure[1] = "rect"
  figure[2] = "star"
  figure[3] = "flower"
  figure[4] = "circle"


  local ball = display.newImage("sBalloons/yellow.png")
  ball.alpha = 0
  ball.y = cY-10
  ball.xScale = 1
  ball.yScale = 1
  sceneGroup:insert(ball)

  local increaseBall

  local pin = display.newRect(cX,cY-290, 20, 20)
  pin.alpha = 0
  sceneGroup:insert(pin)
  physics.addBody( pin, "static"  )

  local speed = 0.0001



  local scoreGame = 0
  local number = {}


  for i = 1, 10 do
    number[i] = display.newImage("numbers/0.png", cX-8,cY-100)
    number[i].x = number[i].x + 555
    number[i].y = number[i].y - 310
    number[i].xScale = 0.01
    number[i].yScale = 0.01
    sceneGroup:insert(number[i])
  end



  local wowPaint = {
      type = "gradient",
      color1 = { 1, 0.5, 0.1 },
      color2 = { 1, 0.3, 0 },
      direction = "down"
  }

  local middlePaint = {
      type = "gradient",
      color1 = { 1, 0.1, 0.1 },
      color2 = { 0, 0, 0 },
      direction = "down"
  }


--*****↑↑↑↑↑↑↑↑↑↑↑↑****
--Create some variables


--Main function which generating random balloons
--*******************↓↓↓↓↓↓↓↓↓↓*****************

  local function createBall()

      ball:removeSelf()
      ballExG:removeSelf()
      ballExR:removeSelf()
      Runtime:removeEventListener( "enterFrame", increaseBall )

      ball.xScale = 0.09
      ball.yScale = 0.09

      local sizeSmall
      local sizeBig
      local randSize = math.random(1,5)
      sizeBig = (randSize + 0.5) / 55
      sizeSmall = randSize / 250

      local randColor = math.random(1,6)
      local randFigure = math.random(1,4)


      ballExG = display.newImage("sBalloons/"..figure[randFigure].."Limit.png",cX,cY-20)
      ballExG:setFillColor(0.1,0.7,0.1)
      ballExG.alpha = 1
      ballExG.xScale = ball.xScale + 0.5 - sizeBig + 0.05
      ballExG.yScale = ball.yScale + 0.5 - sizeBig + 0.05
      sceneGroup:insert(ballExG)

      ballExR = display.newImage("sBalloons/"..figure[randFigure].."Limit.png",cX,cY-20)
      ballExR:setFillColor(0.9,0.1,0.1)
      ballExR.alpha = 1
      ballExR.xScale = ball.xScale + 0.4 - sizeSmall
      ballExR.yScale = ball.yScale + 0.4 - sizeSmall
      sceneGroup:insert(ballExR)


      if(figure[randFigure] == "circle") then
        ball = display.newImage("sBalloons/"..figure[randFigure]..""..colors[randColor]..""..circleSkin..".png",cX,cY-20)
        ball.alpha = 1
        ball.xScale = 0.3
        ball.yScale = 0.3
        sceneGroup:insert(ball)
      elseif (figure[randFigure] == "rect") then
        ball = display.newImage("sBalloons/"..figure[randFigure]..""..colors[randColor]..""..rectSkin..".png",cX,cY-20)
        ball.alpha = 1
        ball.xScale = 0.3
        ball.yScale = 0.3
        sceneGroup:insert(ball)
      elseif (figure[randFigure] == "star") then
        ball = display.newImage("sBalloons/"..figure[randFigure]..""..colors[randColor]..""..starSkin..".png",cX,cY-20)
        ball.alpha = 1
        ball.xScale = 0.3
        ball.yScale = 0.3
        sceneGroup:insert(ball)
      elseif (figure[randFigure] == "flower") then
        ball = display.newImage("sBalloons/"..figure[randFigure]..""..colors[randColor]..""..flowerSkin..".png",cX,cY-20)
        ball.alpha = 1
        ball.xScale = 0.3
        ball.yScale = 0.3
        sceneGroup:insert(ball)
      end


      local randSpeed = math.random(1,10)
      randSpeed = randSpeed / 3000

      function increaseBall()
        ball.xScale = ball.xScale + 0.0016 + randSpeed + speed
        ball.yScale = ball.yScale + 0.0016 + randSpeed + speed
      end
      Runtime:addEventListener( "enterFrame", increaseBall )

  end

--***************↑↑↑↑↑↑↑↑↑↑↑↑*******************
--Main function which generating random balloons





--The button is the full phone screen
--************↓↓↓↓↓↓↓↓↓↓*************

  local button = display.newRect(cX,cY+160,300,1000)
  button:setFillColor(0.1,0.7,0.1)
  button.alpha = 0.01
  button.xScale = 3.1
  button.yScale = 3.1
  sceneGroup:insert(button)

--**********↑↑↑↑↑↑↑↑↑↑↑↑************
--The button is the full phone screen


--Function of button handler
--*******↓↓↓↓↓↓↓↓↓↓*********

  local function touchDelay()

    button:addEventListener("touch", function(e)

      if e.phase == "began" then

        if (ball.xScale > ballExR.xScale and ball.xScale < ballExG.xScale) then

          speed = speed + 0.0001  --speedUp

          if(scoreGame%10==0) then
            confetti:start()
            local function stopConfetti()  --confetti animation every 5 successful clicks
              confetti:stop()
            end
            timer.performWithDelay( 800, stopConfetti )
          end


          if(ball.xScale - ballExR.xScale < 0.02 or ballExG.xScale - ball.xScale < 0.02 ) then

            local wow = display.newText("Wow!",cX - 220 + math.random(1,2)*150 ,cY-130 + math.random(5,7)*50 , "namesFont.otf")
            wow.size = 50
            wow.fill = wowPaint   --achievement when you click on the verge
            sceneGroup:insert(wow)
            transition.fadeOut( wow, { time=600 } )

          end


          if((ballExG.xScale + ballExR.xScale)/2 - ball.xScale < 0.01 and (ballExG.xScale + ballExR.xScale)/2 - ball.xScale > -0.01  ) then

            local wow = display.newText("In the middle!",cX,cY-180 + math.random(5,7)*50, "namesFont.otf")
            wow.rotation = 20
            wow.size = 40
            wow.fill = middlePaint  --achievement when you click in the middle
            sceneGroup:insert(wow)
            transition.fadeOut( wow, { time=600 } )

          end

          createBall() --call main function


--Display of the record
--******↓↓↓↓↓↓↓↓↓↓******

          local a = 0;
          scoreGame = scoreGame + 12

          local score2 = scoreGame;
          local score3 = scoreGame;

          while score2 >= 0.9 do
            a = a + 1;
            score2 = score2/10 - (score2%10/10);
          end

          for i = 1, a do
          number[i]:removeSelf()
          end

          a = 0

          while score3 >= 0.5 do
            a = a + 1
            local lastNumber = score3%10 ;
            number[a] = display.newImage("numbers/"..lastNumber..".png", cX-8,cY-100)
            number[a].x = number[a].x - a*50 + 80
            number[a].y = number[a].y - 90
            number[a].xScale = 0.15
            number[a].yScale = 0.15
            sceneGroup:insert(number[a])
            physics.addBody( number[a], { density=0, friction=0.3, bounce=0.2, radius=30 } )
            local ropeJoint = physics.newJoint( "rope", pin, number[a], offsetA_x, offsetA_y, offsetB_x, offsetB_y )
            score3 = score3/10 - (score3%10/10);
          end

--*****↑↑↑↑↑↑↑↑↑↑↑↑****
--Display of the record



        else

          --if you losing then..

          Runtime:removeEventListener( "enterFrame", increaseBall )
          button.alpha = 0
          ball.alpha = 0
          animationOfHose:pause()

          burstBalloon.alpha = 1
          burstBalloon:play() -- start burst animation

          if scoreGame > score then
            score = scoreGame
          end

          local function goToSceneWithDelay()
            composer.gotoScene( "scenes.menu" , {effect = "fade", time = 2000} );
          end
          timer.performWithDelay( 500, goToSceneWithDelay )

        end

      end

      return true
    end)

  end


--******↑↑↑↑↑↑↑↑↑↑↑↑********
--Function of button handler


timer.performWithDelay( 2720, createBall)
timer.performWithDelay( 3000, touchDelay)


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
        composer.removeScene("scenes.game")
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
