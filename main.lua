function love.load()
	math.randomseed(os.time())
	Object = require 'classic'
	require 'ball'
	require 'paddle'
	love.graphics.setBackgroundColor(0,0,0)
	b1 = Ball()
	p1 = Paddle(0,"w","s")
	p2 = Paddle(love.graphics.getWidth()-10,"up","down")
	font = love.graphics.setNewFont("font.TTF",70)
	love.window.setTitle("PONG! Made By Shameel-MSKVZenon")

end

function love.update(dt)
	p1:update(dt)
	p2:update(dt)
	temp = b1:update(dt,p1.x,p1.y,p1.w,p1.h,p2.x,p2.y,p2.w,p2.h)
	if temp == "p1" then
		p1.score = p1.score + 1
		b1:Restart()
	elseif temp == "p2" then
		p2.score = p2.score + 1
		b1:Restart()
	end
end

function love.draw()
	b1:draw()
	p1:draw()
	p2:draw()
	love.graphics.line(love.graphics.getWidth()/2,0,love.graphics.getWidth()/2,love.graphics.getHeight())
	love.graphics.print(p1.score,love.graphics.getWidth()/4,20)
	love.graphics.print(p2.score,love.graphics.getWidth()-love.graphics.getWidth()/4,20)
	
end