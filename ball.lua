function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

Ball = Object:extend()

function Ball:new()
	self.radius = 7
	self.x = love.graphics.getWidth()/2
	self.y = love.graphics.getHeight()/2
	self.dx = math.random(0,1)
	self.dy = math.random(0,1)
	self.waitTimer = 0
	if self.dx == 0 then
		self.dx = -150
	elseif self.dx == 1 then
		self.dx = 150
	end
	if self.dy == 0 then
		self.dy = -150
	elseif self.dy == 1 then
		self.dy = 150
	end
	print("x"..self.dx,"y"..self.dy)
end

function Ball:update(dt,x2,y2,w2,h2,x3,y3,w3,h3)
	if self.waitTimer == 0 then
		self.x = self.x + self.dx * dt
		self.y = self.y + self.dy * dt
	end


	if self.waitTimer>0 then
		self.waitTimer = self.waitTimer - 1
	end



	if CheckCollision(self.x,self.y,self.radius,self.radius,x2,y2,w2,h2) or CheckCollision(self.x,self.y,self.radius,self.radius,x3,y3,w3,h3) then
		self.dx = -self.dx
		self.dy = -self.dy
	end

	if self.y>love.graphics.getHeight() or self.y < 0 then
		self.dy = -self.dy
	end


	if self.x > love.graphics.getWidth() then
		return "p2"
	elseif self.x < 0 then
		return "p1"
	end

	return nil


end

function Ball:draw()
	love.graphics.setColor(255,255,255)
	love.graphics.circle("fill",self.x,self.y,self.radius)


end

function Ball:Restart()
	self.x = love.graphics.getWidth()/2
	self.y = love.graphics.getHeight()/2
	self.waitTimer = 100

end