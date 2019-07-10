local composer = require( "composer" )

local scene = composer.newScene()
local chpock = audio.loadStream( "chpock.mp3" )
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



  local back = display.newGroup();
  local body = display.newRoundedRect( back, 0, 0, 30, 30, 10 );
  local backImage = display.newImage("button2.png", cX/4.5,cY*1.97)
  backImage.xScale = 0.06
  backImage.yScale = 0.12


  back.x = cX/4.5;
  back.y = cY*1.97;
  back.xScale = 1.6
  back.yScale = 1.6

  local backImage1 = display.newImage("backImage.png", cX/4.6,cY*1.976)
  backImage1.xScale = 0.06
  backImage1.yScale = 0.06
  backImage1.rotation = 180

  local backText = display.newText( back, "back", 0, 0,fontMain, 13 );
  backText:setFillColor(0.1,0.1, 0.1);





  body.alpha = 0

  sceneGroup:insert(back)


  sceneGroup:insert(backImage);
  sceneGroup:insert(backImage1)

  local ballExG = display.newCircle(cX,cY,30)
  ballExG:setFillColor(0.1,0.7,0.1)
  ballExG.alpha = 0.5
  ballExG.xScale = 3.1
  ballExG.yScale = 3.1
  sceneGroup:insert(ballExG)

  local ballExR = display.newCircle(cX,cY,30)
  ballExR:setFillColor(0.9,0.1,0.1)
  ballExR.alpha = 0.5
  ballExR.xScale = 2.5
  ballExR.yScale = 2.5
  sceneGroup:insert(ballExR)

  local ballExR1 = display.newCircle(cX,cY,30)
  ballExR1:setFillColor(0.9,0.1,0.1)
  ballExR1.alpha = 0.5
  ballExR1.xScale = 3.8
  ballExR1.yScale = 3.8
  sceneGroup:insert(ballExR1)





local ball = display.newCircle(cX,cY,30)
ball.alpha = 0.5
ball.xScale = 1
ball.yScale = 1
sceneGroup:insert(ball)

local increaseBall

local function createBall()



  ball:removeSelf()
  ballExG:removeSelf()
  ballExR:removeSelf()
  ballExR1:removeSelf()
  Runtime:removeEventListener( "enterFrame", increaseBall )


  ball.xScale = 1
  ball.yScale = 1

  local sizeSmall
  local sizeBig
  local randSize = math.random(1,10)
  sizeSmall = randSize / 100 * 2.5

  ballExG = display.newCircle(cX,cY,30)
  ballExG:setFillColor(0.1,0.7,0.1)
  ballExG.alpha = 0.5
  ballExG.xScale = ball.xScale + 2.1 - sizeSmall
  ballExG.yScale = ball.yScale + 2.1 - sizeSmall
  sceneGroup:insert(ballExG)

  ballExR = display.newCircle(cX,cY,30)
  ballExR:setFillColor(0.9,0.1,0.1)
  ballExR.alpha = 0.5
  ballExR.xScale = ball.xScale + 1.5
  ballExR.yScale = ball.yScale + 1.5
  sceneGroup:insert(ballExR)

  ballExR1 = display.newCircle(cX,cY,30)
  ballExR1:setFillColor(0.9,0.1,0.1)
  ballExR1.alpha = 0.5
  ballExR1.xScale = ball.xScale + 2.8
  ballExR1.yScale = ball.yScale + 2.8
  sceneGroup:insert(ballExR1)

  ball = display.newCircle(cX,cY,30)
  ball.alpha = 0.5
  ball.xScale = 1
  ball.yScale = 1
  sceneGroup:insert(ball)

  local speed
  local randSpeed = math.random(1,10)
  randSpeed = randSpeed / 500 * 1.5




function increaseBall()

  --ball.xScale = ball.xScale + 0.005 + randSpeed
  --ball.yScale = ball.yScale + 0.005 + randSpeed



end
Runtime:addEventListener( "enterFrame", increaseBall )

end

createBall()

local button = display.newRect(cX,cY+160,30,10)
button:setFillColor(0.1,0.7,0.1)
button.alpha = 1
button.xScale = 3.1
button.yScale = 3.1
sceneGroup:insert(button)

button:addEventListener("touch", function(e)
  if e.phase == "began" then
  if (ball.xScale > ballExR.xScale and ball.xScale < ballExG.xScale) then
    print("WIN")
    createBall()
  else
    Runtime:removeEventListener( "enterFrame", increaseBall )


  end
  end
  return true
end)



local flower = display.newImage("sBalloons/flowerLimit.png",cX,cY-160)
flower.xScale = 0.5
flower.alpha = 0.5
flower.yScale = 0.5


local flower = display.newImage("sBalloons/flowerLimit.png",cX,cY-160)
flower.xScale = 0.6
flower.alpha = 0.5
flower.yScale = 0.6

local flower = display.newImage("sBalloons/flowerGreen.png",cX,cY-160)
flower.xScale = 0.3
flower.alpha = 0.7
flower.yScale = 0.3


local paint = {
    type = "gradient",
    color1 = { 0.7, 0, 0.1 },
    color2 = { 0, 0, 0.5 },
    direction = "down"
}

local paint1 = {
    type = "gradient",
    color1 = { 1, 0.1, 0.1 },
    color2 = { 0, 0, 0 },
    direction = "down"
}



local wow = display.newText("Wow!",cX,cY+127)
wow.size = 50
wow.fill = paint


local wow = display.newText("Wow!",cX - 220 + math.random(1,2)*150 ,cY-130 + math.random(5,7)*50 , "namesFont.otf")
wow.size = 50
wow.alpha = 0.7
wow.fill = paint1
sceneGroup:insert(wow)





local wow = display.newText("In the middle!",cX,cY-180 + math.random(1,7)*50, "namesFont.otf")
wow.rotation = 20
wow.fill = paint
wow.size = 40
sceneGroup:insert(wow)



back:addEventListener("touch", function(e)
  if e.phase == "began" then
    Runtime:removeEventListener( "enterFrame", increaseBall )
    composer.gotoScene( "scenes.menu" , {effect = "fade", time = 300} );
  end
  return true
end)

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

        composer.removeScene("scenes.textsRus")

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
