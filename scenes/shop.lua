local composer = require( "composer" )

local scene = composer.newScene()
local widget = require( "widget" )

-- -----------------------------------------------------------------------------------

function scene:create( event )



    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    local background = display.newRect(sceneGroup, cX, cY, W-SOX*2, H-SOY*2)
  --  background:setFillColor(0.4, 0.5, 0.59);





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




    local function scrollListener( event )

        local phase = event.phase
        if ( phase == "began" ) then print( "Scroll view was touched" )
        elseif ( phase == "moved" ) then print( "Scroll view was moved" )
        elseif ( phase == "ended" ) then print( "Scroll view was released" )
        end

        -- In the event a scroll limit is reached...
        if ( event.limitReached ) then
            if ( event.direction == "up" ) then print( "Reached bottom limit" )
            elseif ( event.direction == "down" ) then print( "Reached top limit" )
            elseif ( event.direction == "left" ) then print( "Reached right limit" )
            elseif ( event.direction == "right" ) then print( "Reached left limit" )
            end
        end

        return true
    end

    -- Create the widget
    local shopListFirst = widget.newScrollView(
        {
            top = 70,
            left = 30,
            width = 260,
            height = 460,
            scrollWidth = 100,
            scrollHeight = 200
    			--	topPadding = 5

        }
    )
    shopListFirst:setIsLocked( true, "horizontal" )
    sceneGroup:insert(shopListFirst)




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
