local fundo = display.newRect( -35, 10, 1200, 720 )
fundo:setFillColor(0, 1, 0)
local multiplicadorDeTitulos = 35
local altura = display.actualContentHeight
local largura = display.actualContentWidth
local larguraObstaculo = 40
local posicaoXObstaculo = 100
local alturaObstaculo = 10
local obstaculos = {}
local contador = 1
local quartoObstaculoNaoCriado = true
local distancia = 150
local storyboard = require( "composer" )
local scene = storyboard.newScene()
local obstaculo1 = display.newRect(0,0,0,0)
local obstaculo1B = display.newRect(0,0,0,0)
local texto1 = display.newText( "" , obstaculo1.x, obstaculo1.y, native.systemFont, 10  )

local obstaculo2 = display.newRect(0,0,0,0)
local obstaculo2B = display.newRect(0,0,0,0)
local texto2 = display.newText( "" , obstaculo2.x, obstaculo2.y, native.systemFont, 10  )

local obstaculo3 = display.newRect(0,0,0,0)
local obstaculo3B = display.newRect(0,0,0,0)
local texto3 = display.newText( "" , obstaculo3.x, obstaculo3.y, native.systemFont, 10  )

local obstaculo4 = display.newRect(0,0,0,0)
local obstaculo4B = display.newRect(0,0,0,0)
local texto4 = display.newText( "" , obstaculo4.x, obstaculo4.y, native.systemFont, 10  )



print("Largura ".. largura)
function criaObstaculo(obstaculo, obstaculoB, texto)

  local sx = obstaculo.contentWidth/texto.contentWidth
  local sy = obstaculo.contentHeight/texto.contentHeight
  local scale = (sx < sy ) and sx or sy
  texto:scale( scale, scale )
end

function criaObstaculoUm(nome, cor, quantidadeDeTitulos)
  local posicaoXObstaculo = distancia
  local posicaoYObstaculo = 10
  alturaObstaculo = (quantidadeDeTitulos*multiplicadorDeTitulos)
  obstaculo1 = display.newRect( posicaoXObstaculo, posicaoYObstaculo, larguraObstaculo, alturaObstaculo)
  obstaculo1:setFillColor(unpack(cor))
  obstaculo1B = display.newRect( posicaoXObstaculo, altura-posicaoYObstaculo, larguraObstaculo, alturaObstaculo )
  obstaculo1B:setFillColor(unpack(cor))
  texto1 = display.newText( nome, obstaculo1.x, obstaculo1.y, native.systemFont, 10  )
  texto1:setFillColor(1,1,1)
  criaObstaculo(obstaculo1, obstaculo1B, texto1)
end

function criaObstaculoDois(nome, cor, quantidadeDeTitulos)
  local posicaoXObstaculo = distancia*2
  local posicaoYObstaculo = 10
  alturaObstaculo = (quantidadeDeTitulos*multiplicadorDeTitulos)
  obstaculo2 = display.newRect( posicaoXObstaculo, posicaoYObstaculo, larguraObstaculo, alturaObstaculo)
  obstaculo2:setFillColor(unpack(cor))
  obstaculo2B = display.newRect( posicaoXObstaculo, altura-posicaoYObstaculo, larguraObstaculo, alturaObstaculo )
  obstaculo2B:setFillColor(unpack(cor))
  texto2 = display.newText( nome, obstaculo2.x, obstaculo2.y, native.systemFont, 10  )
  texto2:setFillColor(1,1,1)
  criaObstaculo(obstaculo2, obstaculo2B, texto2)
end

function criaObstaculoTres(nome, cor, quantidadeDeTitulos)
  local posicaoXObstaculo = distancia*3
  local posicaoYObstaculo = 10
  alturaObstaculo = (quantidadeDeTitulos*multiplicadorDeTitulos)
  obstaculo3 = display.newRect( posicaoXObstaculo, posicaoYObstaculo, larguraObstaculo, alturaObstaculo)
  obstaculo3:setFillColor(unpack(cor))
  obstaculo3B = display.newRect( posicaoXObstaculo, altura-posicaoYObstaculo, larguraObstaculo, alturaObstaculo )
  obstaculo3B:setFillColor(unpack(cor))
  texto3 = display.newText( nome, obstaculo3.x, obstaculo3.y, native.systemFont, 10  )
  texto3:setFillColor(1,1,1)
  criaObstaculo(obstaculo3, obstaculo3B, texto3)
end

function criaObstaculoQuatro(nome, cor, quantidadeDeTitulos)
  local posicaoXObstaculo = (distancia*3)+larguraObstaculo
  local posicaoYObstaculo = 10
  alturaObstaculo = (quantidadeDeTitulos*multiplicadorDeTitulos)
  obstaculo4 = display.newRect( posicaoXObstaculo, posicaoYObstaculo, larguraObstaculo, alturaObstaculo)
  obstaculo4:setFillColor(unpack(cor))
  obstaculo4B = display.newRect( posicaoXObstaculo, altura-posicaoYObstaculo, larguraObstaculo, alturaObstaculo )
  obstaculo4B:setFillColor(unpack(cor))
  texto4 = display.newText( nome, obstaculo4.x, obstaculo4.y, native.systemFont, 10  )
  texto4:setFillColor(1,1,1)
  criaObstaculo(obstaculo4, obstaculo4B, texto4)
end

function criaObstaculos()
  criaObstaculoUm("Flamengo", { 1, 0, 0 }, 6)
  criaObstaculoDois("Botafogo", { 0, 0, 0 }, 2)
  criaObstaculoTres("Fluminense", { 1, 0, 0 }, 3)

end

criaObstaculos()

function transporta(obstaculo, obstaculoB, texto)
  local velocidade = 0.5
  obstaculo.x = obstaculo.x - velocidade
  obstaculoB.x = obstaculoB.x - velocidade
  texto.x = texto.x - velocidade
end

local function atualiza (event)

  transporta(obstaculo1, obstaculo1B, texto1)
  transporta(obstaculo2, obstaculo2B, texto2)
  transporta(obstaculo3, obstaculo3B, texto3)
  transporta(obstaculo4, obstaculo4B, texto4)

  if obstaculo3.x-larguraObstaculo == (distancia*2) and quartoObstaculoNaoCriado then
    criaObstaculoQuatro("Vasco", { 1, 1, 0 }, 4)
    quartoObstaculoNaoCriado = false
  end

if obstaculo1.x <= -60 then
  obstaculo1.x = obstaculo4.x + distancia
elseif obstaculo2.x <= -60 then
  obstaculo2.x = obstaculo1.x + distancia
elseif obstaculo3.x <= -60 then
  obstaculo3.x = obstaculo2.x + distancia
elseif obstaculo4.x <= -60 then
  obstaculo4.x = obstaculo3.x + distancia
end
--[[

if (pBot01.x <= -20) then
  pBot01.x = pBot04.x + 80
elseif (pBot02.x <= -20) then
  pBot02.x = pBot01.x + 80
elseif (pBot03.x <= -20) then
  pBot03.x = pBot02.x + 80
elseif (pBot04.x <= -20) then
  pBot04.x = pBot03.x + 80
end
	pBot02.x = pBot02.x - 0.5
	pTop02.x = pBot02.x - 0.5

	pBot03.x = pBot03.x - 0.5
	pTop03.x = pBot03.x - 0.5

	pBot04.x = pBot04.x - 0.5
	pTop04.x = pBot04.x - 0.5
  ]]--

end

Runtime:addEventListener ("enterFrame", atualiza)
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene
