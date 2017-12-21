-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local fundo = display.newRect( -35, 10, 1200, 720 )
local titulo = display.newText( "Escolha seu time" , display.contentCenterX, 20, native.systemFont, 20  )
titulo:setFillColor(0, 0, 0)

local function iniciaJogo( event )

  composer.gotoScene( "jogo" )


end

local flamengo = display.newImage( "Icon.png" )
flamengo.x = 50
flamengo.y = 100

flamengo:addEventListener( "touch", iniciaJogo)
