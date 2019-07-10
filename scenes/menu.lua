-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
H = display.contentHeight;
W = display.contentWidth;

cX = W/2;
cY = H/2;

local switches;

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
  --	onEmitEnd = function(v) v.perEmit = math_random(5, 15) end,
    physics = {
      velocity = 0.3,
      gravityY = -0.003
    }

})

vent:start()



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view



    local menuGroup = display.newGroup();
	--	local colors = {};
		--colors[1] = {0.2,0.1}
    local bg = display.newRect( sceneGroup, cX, cY, W-SOX*2, H-SOY*2);
    --bg:setFillColor(0.4, 0.5, 0.59);
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






    sceneGroup:insert(vent)
    sceneGroup:insert(menuGroup);



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


    physics.setGravity( 0.1, -0.4)

    local circle1 = display.newImage("sBalloons/yellow.png" ,cX+15, cY-150 )
    physics.addBody( circle1, "dynamic", {radius=1} )
    circle1.xScale = 0.03
    circle1.yScale = 0.03
    sceneGroup:insert(circle1)
    local circle2 = display.newCircle(cX+20, cY-50, 10 )
    circle2:setFillColor(1,0.8,0, 0.8)
    physics.addBody( circle2, "static", { box=offsetRectParams, radius=1}  )
    sceneGroup:insert(circle2)
  --  local ropeJoint = physics.newJoint( "rope", circle1, circle2, offsetA_x, offsetA_y, offsetB_x, offsetB_y )



  local ropeParts = {}

  for k = 1, 8 do
      local ropePart = display.newImage("sBalloons/yellow.png", circle2.x - 5, (circle2.y-4) - k*9) --10 = rope part height
      ropePart.name = "rope"
      ropePart.xScale = 0.007
      ropePart.yScale = 0.007
      ropePart.rotation = 0
      physics.addBody( ropePart, { radius=1, density=0, friction=0, bounce=0 } )
      ropeParts[k] = ropePart
      physics.addBody( ropeParts[1], "static", {  radius=1} )
      ropePart.gravityScale = -0.08
      sceneGroup:insert(ropePart)




    if(k == 1) then
             local hangJoint = physics.newJoint("pivot", ropePart, circle2, circle2.x - 0, circle2.y-0)
         end

         if(k > 1) then
             local joint = physics.newJoint("pivot", ropeParts[k-1], ropeParts[k], circle1.x - 3, ropePart.y)
         end


         if(k == 8) then
             local boneJoint = physics.newJoint("pivot", circle1, ropePart, circle2.x - 3, ropePart.y-2)
         end
     end




     local circle3 = display.newImage("sBalloons/yellow.png" ,cX-35, cY-150 )
     physics.addBody( circle3, "dynamic", {radius=1} )
     circle3.xScale = 0.03
     circle3.yScale = 0.03
     sceneGroup:insert(circle3)
     local circle4 = display.newCircle(cX-35, cY-50, 10 )
     circle4:setFillColor(1,0.8,0, 0.7)
     physics.addBody( circle4, "static", { box=offsetRectParams, radius=1}  )
     sceneGroup:insert(circle4)



     local ropeParts1 = {}

     for k = 1, 8 do
         local ropePart1 = display.newImage("sBalloons/yellow.png", circle4.x - 5, (circle4.y-5) - k*9) --10 = rope part height
         ropePart1.name = "rope"
         ropePart1.xScale = 0.007
         ropePart1.yScale = 0.007
         ropePart1.rotation = 0
         physics.addBody( ropePart1,"dynamic", { radius=1, density=0, friction=0, bounce=0 } )
         ropePart1.gravityScale = -0.08
         ropeParts1[k] = ropePart1
         physics.addBody( ropeParts1[1], "static", {  radius=1} )
         sceneGroup:insert(ropePart1)




       if(k == 1) then
                local hangJoint = physics.newJoint("pivot", ropePart1, circle4, circle4.x - 0, circle4.y-0)
            end

            if(k > 1) then
                local joint = physics.newJoint("pivot", ropeParts1[k-1], ropeParts1[k], circle3.x - 3, ropePart1.y)
            end


            if(k == 8) then
                local boneJoint = physics.newJoint("pivot", circle3, ropePart1, circle4.x - 3, ropePart1.y-2)
            end
        end





     -- Function to handle button events




local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then

       --composer.gotoScene( "scenes.inv" , {effect = "fade", time = 300} );
    end
end

-- Create the widget
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




--[[
local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
       composer.gotoScene( "scenes.shop" , {effect = "fade", time = 300} );
    end
end

-- Create the widget
local shop = widget.newButton(
    {
        left = -55,
        top = 296,
        defaultFile = "menu/shopBig.png",
        overFile = "menu/shopSmall.png",
        onEvent = handleButtonEvent,

    }
)
shop.xScale = 0.38
shop.yScale = 0.38
sceneGroup:insert(shop)



local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then

       composer.gotoScene( "scenes.inv" , {effect = "fade", time = 300} );
    end
end

-- Create the widget
local inv = widget.newButton(
    {
        left = 60,
        top = 310,
        defaultFile = "menu/invBig.png",
        overFile = "menu/invSmall.png",
        onEvent = handleButtonEvent,

    }
)
inv.xScale = 0.38
inv.yScale = 0.38
sceneGroup:insert(inv)

--]]


local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
       composer.gotoScene( "scenes.game" , {effect = "fade", time = 300} );
    end
end

-- Create the widget
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



--[[local money = _data:get("money")
local moneyOpposite = 0
local a = 0
local number = {}

local dollar = display.newImage("money/$.png", cX-120,cY-100)
dollar.x = cX - 120
dollar.y = cY + 255
dollar.alpha = 0.8
dollar.xScale = 0.079
dollar.yScale = 0.079
sceneGroup:insert(dollar)

while money >= 0.9 do
local lastNumber = money%10
moneyOpposite = moneyOpposite + lastNumber;
moneyOpposite = moneyOpposite * 10;
money = money/10 - (money%10/10)
end

moneyOpposite = moneyOpposite / 10;

while moneyOpposite >= 0.1 do
  local lastNumber = moneyOpposite%10
  a = a + 1;
  number[a] = display.newImage("money/"..lastNumber..".png", cX-8,cY-100)
  number[a].x = number[a].x + a*26 - 93
  number[a].y = cY + 256
  number[a].alpha = 0.8
  number[a].xScale = 0.06
  number[a].yScale = 0.06
  sceneGroup:insert(number[a])
  moneyOpposite = moneyOpposite/10 - (moneyOpposite%10/10)
end



local whiteDot = display.newRoundedRect(cX-97.1,cY+253.02,7,6.5,2)
whiteDot:setFillColor(1,1,1)
sceneGroup:insert(whiteDot)

local greenDot = display.newRect(cX-97,cY+253,5,5)
greenDot:setFillColor(0.65,0.7,0.5)
sceneGroup:insert(greenDot)


local whiteDot = display.newRoundedRect(cX-97.1,cY+263.02,7,6.5,2)
whiteDot:setFillColor(1,1,1)
sceneGroup:insert(whiteDot)

local greenDot = display.newRect(cX-97,cY+263,5,5)
greenDot:setFillColor(0.65,0.7,0.5)
sceneGroup:insert(greenDot)
  --]]

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
