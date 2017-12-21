local fundo = display.newRect( -35, 10, 1200, 720 )
fundo:setFillColor(0, 1, 0)
local storyboard = require( "composer" )
local scene = storyboard.newScene()

function scene:createScene( event )


end

function scene:enterScene( event )

end

function scene:exitScene( event )

end

function scene:destroyScene( event )

end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene
