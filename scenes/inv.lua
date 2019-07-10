local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------


local chpock = audio.loadStream( "chpock.mp3" )

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )








    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen




    local background = display.newRect(sceneGroup, cX, cY, W-SOX*2, H-SOY*2)
  --  background:setFillColor(0.4, 0.5, 0.59);

    local back = display.newGroup();



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
  --  display.newImage( [parent,] filename [,baseDir] [,x,y] [,isFullResolution])




    back:addEventListener("touch", function(e)
      if e.phase == "began" then
        audio.play( chpock )
        composer.gotoScene( "scenes.menu" , {effect = "fade", time = 300} );
      end
      return true
    end)

    local objects = display.newGroup();


    local white = display.newImageRect( "lines.png",  100, 100 );
    white.x= cX;
    white.y = cY-51;
    white.xScale = 0.05
    white.yScale = 4
    objects:insert(white);


    local white = display.newImageRect( "lines1.png",  100, 100 );
    white.x= cX+158;
    white.y = cY+2;
    white.xScale = 0.1
    white.yScale = 5.09
    white.rotation = 180
    objects:insert(white);

    local white = display.newImageRect( "lines1.png",  100, 100 );
    white.x= cX-158;
    white.y = cY+2;
    white.xScale = 0.1
    white.yScale = 5.09
    objects:insert(white);

    local paint = {
        type = "gradient",
        color1 = { 1, 0, 0.7 },
        color3 = { 0.5, 0.2, 0.4 },
        color2 = { 0.1, 0, 0, 0.2 },
        direction = "down"
    }

    local white = display.newImageRect( "lines1.png",  100, 100 );
    white.x= cX-10;
    white.y = cY-276;
    white.xScale = 0.5
    white.yScale = 5.7
    white.rotation = 270
    objects:insert(white);
    local white = display.newImageRect( "lines1.png",  100, 100 );
    white.x= cX;
    white.y = cY+281;
    white.xScale = 0.5
    white.yScale = 5.7
    white.rotation = 90
    objects:insert(white);

    local white = display.newImageRect( "lines1.png",  100, 100 );
    white.x= cX;
    white.y = cY-150;
    white.xScale = 0.3
    white.yScale = 3.07
    white.rotation = 90

    objects:insert(white);




    local russian = display.newText( "Russian:",  73, 41 );
    russian.xScale = 1.2
    russian.yScale = 1.2

    sceneGroup:insert(russian)

    local eng = display.newText( "English:",  230, 41 );
    eng.xScale = 1.2
    eng.yScale = 1.2
    sceneGroup:insert(eng)

    local speedtext = display.newText( "Text speed:",  cX, cY-150 );
    speedtext.xScale = 1.4
    speedtext.yScale = 1.4
  --  speedtext:setFillColor(0.4, 0.5, 0.59)



    objects:insert(speedtext);

    objects:insert(back)


    objects:insert(backImage);
    objects:insert(backImage1)
    body.alpha = 0
    --backText.alpha = 0




    for i = 1 , 5 do
      local sp1 = display.newText( _data:get("speedRus"..i) or "",  118 , 130 + (i - 1) * 50 );


      local text1r = display.newText( "Текст №"..i..":",  55, sp1.y );
      objects:insert(sp1);
      objects:insert(text1r);

  end



  for i = 1 , 5 do
    local sp2 = display.newText( _data:get("speedEng"..i) or "",  260 , 130 + (i - 1) * 50 );


    local text1r = display.newText( "Text №"..i..":",  205, 130 + (i - 1) * 50);
    objects:insert(sp2);
    objects:insert(text1r);

end




    local white = display.newImageRect( "lines1.png",  100, 100 );
    white.x= cX;
    white.y = cY+140;
    white.xScale = 0.3
    white.yScale = 3.07
    white.rotation = 90
    objects:insert(white);

    local speedtext = display.newText( "Word speed:",  cX, cY+140 );
    speedtext.xScale = 1.4
    speedtext.yScale = 1.4
  --  speedtext:setFillColor(0.4, 0.5, 0.59)
    objects:insert(speedtext);

    --[[local secr = display.newText( "30 сек:",  50, 415 );
    secr.xScale = 1
    secr.yScale = 1
    objects:insert(secr);

    local minr = display.newText( "1 мин:",  50, 460 );
    minr.xScale = 1
    minr.yScale = 1
    objects:insert(minr); ]]--


    local sec = display.newText( "1 min:",  cX/1.5, 415 );
    sec.xScale = 1
    sec.yScale = 1
    objects:insert(sec);

    local min = display.newText( "2 min:",  cX/1.5, 460);
    min.xScale = 1
    min.yScale = 1
    objects:insert(min);

    for i = 1 , 1 do
      local sp3 = display.newText( _data:get("wordSpeed"..i) or "",  150 , 460 + (i - 1) * 50 );

      objects:insert(sp3);
  end


    sceneGroup:insert(objects)


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
        composer.removeScene( "scenes.results" )
        -- Code here runs immediately after the scene goes entirely off screen

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
