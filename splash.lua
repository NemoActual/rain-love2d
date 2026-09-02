-- set how long splash will exist
local splashframes = 12

local splash = {}
splash.__index = splash

-- create a new splash
function splash.new(x, y)
	local t = setmetatable({}, splash)
	t.x = x
	t.y = y
	t.t = 0
	t.r = 0
	t.a = true
	return t
end

function splash:update()
	-- increase splash radius every frame
	self.r = self.r + 1
	
	-- increate frames
	self.t = self.t + 1
	
	-- if frames exceeds splashframes
	if self.t > splashframes then
		self.a = false
		self.t = 0
	end
end

-- draw splash as simple circle
function splash:draw()
	-- draw only alive splashes
	if self.a then
		love.graphics.circle("line", self.x, self.y, self.r)
	end
end

return splash