
Paddle = Object:extend()

function Paddle:new(x,keyup,keydown)
	self.w = 10
	self.h = 60
	self.y = love.graphics.getHeight()/2 - self.h/2
	self.x = x
	self.speed = 120
	self.keyup = keyup
	self.keydown = keydown
	self.score = 0

end

function Paddle:update(dt)
	if love.keyboard.isDown(self.keyup) then
		self.y = self.y + -self.speed * dt
	elseif love.keyboard.isDown(self.keydown) then
		self.y = self.y + self.speed * dt
	end
end

function Paddle:draw()
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill",self.x,self.y,self.w,self.h)
end