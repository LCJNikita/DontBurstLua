local composer = require( "composer" )
local scene = composer.newScene()
local CBE = require("CBE.CBE")
local physics = require("physics")

--physics.setDrawMode( "hybrid" )
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
    physics.start()

    -- Code here runs when the scene is first created but has not yet appeared on screen

    local background = display.newRect(sceneGroup, cX, cY, W-SOX*2, H-SOY*2)
    --background:setFillColor(0.4, 0.5, 0.59);

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

    background:setFillColor(gradients[math.random(1,4)])


    local circleSkin = 0  --_data:get("circleSkin")
    local rectSkin = 0  --_data:get("rectSkin")
    local starSkin = 0 --_data:get("starSkin")
    local flowerSkin = 0  --_data:get("flowerSkin")

    if circleSkin == 0 then
      circleSkin = "";
    elseif circleSkin == 1 then
      circleSkin = "Skin";
    end

    if rectSkin == 0 then
      rectSkin = "";
    end

    if starSkin == 0 then
      starSkin = "";
    end

    if flowerSkin == 0 then
      flowerSkin = "";
    end




    local scoreGame = 0
    local number = {}

    number[1] = display.newImage("numbers/0.png", cX-8,cY-100)
    number[1].x = number[1].x + 50
    number[1].y = number[1].y - 390
    number[1].xScale = 0.16
    number[1].yScale = 0.16
    sceneGroup:insert(number[1])

    for i = 2, 10 do
      number[i] = display.newImage("numbers/0.png", cX-8,cY-100)
      number[i].x = number[i].x + 555
      number[i].y = number[i].y - 310
      number[i].xScale = 0.01
      number[i].yScale = 0.01
      sceneGroup:insert(number[i])
    end --]]


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


    local sheetOptions =
    {
        width = 296,
        height = 532,
        numFrames = 8
    }

         local sheet_runningCat = graphics.newImageSheet( "hoseAnimation.png", sheetOptions )
         local sequences_runningCat = {

      {     name = "normalRun",
      start = 1,
      count = 8,
      time = 720,
      loopCount = 0
    },

           {
               name = "fastRun",
               frames = { 3,4,5,6,7,8},
               time = 2200
           },
       }
   local runningCat = display.newSprite( sheet_runningCat, sequences_runningCat )
   runningCat.x=cX-1;
   runningCat.y=cY+13;
   --runningCat.xScale = 1;
   --runningCat.yScale = 1;
   --runningCat.rotation = 0;
   sceneGroup:insert(runningCat)


local vent = CBE.newVent({
      title = "sparks",
      positionType = "inRadius",
      emitX = cX, emitY = cY+210,
      build = function() local size = math.random(10, 20) return display.newImageRect("numbers/0.png", 60, 122) end,
      color = {{1}, {0.9, 0.9, 1}},
      emitDelay = 1000,
      perEmit = 1,
      inTime = 1000,
      outTime = 10000,
      startAlpha = 0,
    --	onEmitEnd = function(v) v.perEmit = math_random(5, 15) end,
      physics = {
        velocity = 0.4,
        gravityY = -0.001
      }

  })

  sceneGroup:insert(vent)



-- =============================================== countDownTimer

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


local paint = {
    type = "gradient",
    color1 = { 0.7, 0, 0.1 },
    color2 = { 0, 0, 0.5 },
    direction = "down"
}

local paint1 = {
    type = "gradient",
    color1 = { 0, 0.8, 0.1 },
    color2 = { 0, 0, 0.5 },
    direction = "down"
}

local paint2 = {
    type = "gradient",
    color1 = { 0.3, 0.5, 0.1 },
    color2 = { 1, 0.3, 0 },
    direction = "down"
}

  local one = display.newText("1",cX,cY)
  one.fill = paint
  one.size = 150
  sceneGroup:insert(one)

  local two = display.newText("2",cX,cY)
  two.size = 1
  two.fill = paint1
  sceneGroup:insert(two)

  local three = display.newText("3",cX,cY)
  three.fill = paint2
  three.size = 1
  sceneGroup:insert(three)

  local function increaseNumber(num)
    num.size = num.size + 5
  end

  local check


--size>500
  function increaseThree()
    increaseNumber(three)

    if three.size > 370 then
      three.alpha = 0
      --three:removeSelf()
      Runtime:removeEventListener( "enterFrame", increaseThree )
      runningCat:play();
    end
  end


  function increaseTwo()
    increaseNumber(two)

    if two.size > 370 then
      two.alpha = 0
      --two:removeSelf()
      three.size = 200
      Runtime:addEventListener( "enterFrame", increaseThree )
      Runtime:removeEventListener( "enterFrame", increaseTwo )
    end
  end



  function increaseOne()
    increaseNumber(one)

    if one.size > 350 then
      one.alpha = 0
      --one:removeSelf()
      two.size = 200
      Runtime:addEventListener( "enterFrame", increaseTwo )
      Runtime:removeEventListener( "enterFrame", increaseOne )
    end
  end
  Runtime:addEventListener( "enterFrame", increaseOne ) --]]



-- =============================================== countDownTimer


  local ballExG = display.newImage("sBalloons/circleLimit.png",cX,cY-10)
  ballExG.alpha = 0.5
  ballExG.xScale = 3.1
  ballExG.yScale = 3.1
  sceneGroup:insert(ballExG)

  local ballExR = display.newImage("sBalloons/circleLimit.png",cX,cY-10)
  ballExR:setFillColor(0.9,0.1,0.1)
  ballExR.alpha = 0.5
  ballExR.xScale = 2.5
  ballExR.yScale = 2.5
  sceneGroup:insert(ballExR)



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
ball.alpha = 0.5
ball.y = cY-10
ball.xScale = 1
ball.yScale = 1
sceneGroup:insert(ball)


local increaseBall



local pin = display.newRect(cX,cY-290, 20, 20)
pin.alpha = 0
sceneGroup:insert(pin)
physics.addBody( pin, "static"  )




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


local globalBall
local speed = 0.0001

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

  globalBall = ball


  local randSpeed = math.random(1,10)
  randSpeed = randSpeed / 3000




function increaseBall()

  ball.xScale = ball.xScale + 0.0016 + randSpeed + speed
  ball.yScale = ball.yScale + 0.0016 + randSpeed + speed

end
Runtime:addEventListener( "enterFrame", increaseBall )

end
timer.performWithDelay( 2720, createBall)


local button = display.newRect(cX,cY+160,300,1000)
button:setFillColor(0.1,0.7,0.1)
button.alpha = 0.01
button.xScale = 3.1
button.yScale = 3.1
sceneGroup:insert(button)




local sheetOptions1 =
{
    width = 213 ,
    height = 204,
    numFrames = 5
}

local sheet_runningCat1 = graphics.newImageSheet( "sBalloons/baloonAnimation.png", sheetOptions1 )

local sequences_runningCat1 = {
  -- consecutive frames sequence
  {
      name = "fastRun",
      frames = { 5,4,3,2,1},
      count = 1,
      time = 400,
      loopCount = 1
  }
}


local runningCat1 = display.newSprite( sheet_runningCat1, sequences_runningCat1 )
runningCat1.x = cX
runningCat1.y = cY - 10
runningCat1.alpha = 0
sceneGroup:insert(runningCat1)


local function touchDelay()

button:addEventListener("touch", function(e)

  if e.phase == "began" then



  if (ball.xScale > ballExR.xScale and ball.xScale < ballExG.xScale) then

    speed = speed + 0.0001

    if(scoreGame%10==0) then
      confetti:start()
      local function stopConfetti()
        confetti:stop()
      end
      timer.performWithDelay( 800, stopConfetti )
    end


    print("WIN")


    if(ball.xScale - ballExR.xScale < 0.02 or ballExG.xScale - ball.xScale < 0.02 ) then

      local wow = display.newText("Wow!",cX - 220 + math.random(1,2)*150 ,cY-130 + math.random(5,7)*50 , "namesFont.otf")
      wow.size = 50
      wow.fill = wowPaint
      sceneGroup:insert(wow)
      transition.fadeOut( wow, { time=600 } )

    end


    if((ballExG.xScale + ballExR.xScale)/2 - ball.xScale < 0.01 and (ballExG.xScale + ballExR.xScale)/2 - ball.xScale > -0.01  ) then

      local wow = display.newText("In the middle!",cX,cY-180 + math.random(5,7)*50, "namesFont.otf")
      wow.rotation = 20
      wow.size = 40
      wow.fill = middlePaint
      sceneGroup:insert(wow)
      transition.fadeOut( wow, { time=600 } )

    end


    createBall()
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
        end --]]





    --[[vent = CBE.newVent({
        title = "sparks",
        positionType = "inRadius",
        emitX = cX + 40, emitY = cY+110,
        build = function() local size = math.random(10, 20) return display.newImageRect("numbers/"..score..".png", 60, 122) end,
        color = {{1}, {0.9, 0.9, 1}},
        emitDelay = 1000,
        perEmit = 1,
        inTime = 1000,
        outTime = 5000,
        startAlpha = 0,
      --	onEmitEnd = function(v) v.perEmit = math_random(5, 15) end,
        physics = {
          velocity = 0.4,
          gravityY = -0.01
        }

    })
    vent.alpha = 0.5
    vent:start()
    sceneGroup:insert(vent) --]]




  else
  Runtime:removeEventListener( "enterFrame", increaseBall )
  button.alpha = 0
  --Runtime:removeEventListener( "enterFrame", increaseBall )
  --confetti:destroy()
  runningCat1.x = globalBall.x
  runningCat1.y = globalBall.y
  globalBall.alpha = 0
  runningCat1.alpha = 1
  runningCat:pause()
  runningCat1:play()

  if scoreGame > score then
    score = scoreGame
  end

  local function gotoSceneWithDelay()
    composer.gotoScene( "scenes.menu" , {effect = "fade", time = 2000} );
  end
  timer.performWithDelay( 500, gotoSceneWithDelay )

  print("lose")

  end
  end
  return true
end)




end
timer.performWithDelay( 3000, touchDelay)






--[[for i = 1, a do
number[i]:removeSelf()
end


			score2 = score1;
			a = 0;

			while score2 >= 0.9 do

			local lastNumber = score2%10 ;
			a = a + 1;



			number[a] = display.newImage("numbers/"..lastNumber..".png", cX-8,cY-100)
			number[a].x = number[a].x - a*30 + 250
			number[a].y = number[a].y - 20
			number[a].xScale = 0.08
			number[a].yScale = 0.08
			sceneGroup:insert(number[a])

			transition.to( number[a], { time=1500, x=(cX+60-a*30), y=(cY - 32)} )


			score2 = score2/10 - (score2%10/10); --]]















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
