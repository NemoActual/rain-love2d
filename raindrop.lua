local raindrop = {}
raindrop.__index = raindrop

function raindrop.new()
	local t = setmetatable({}, raindrop)

	t.x = math.random(love.graphics.getWidth())
	t.y = math.random(love.graphics.getHeight())
	t.ty = math.random(t.y, love.graphics.getHeight())

	t.r = 2
	t.s = 400
	t.a = true

	-- store where the drop hit
	t.hx = 0
	t.hy = 0

	return t
end

function raindrop:update(dt)
	self.a = true

	-- move drop down
	self.y = self.y + self.s * dt

	-- if raindrop reaches target
	if self.y > self.ty then

		-- save impact position
		self.hx = self.x
		self.hy = self.ty

		-- reset raindrop
		self.y = 0
		self.x = math.random(love.graphics.getWidth())
		self.ty = math.random(love.graphics.getHeight())

		self.a = false
	end
end

-- draw simple circle
function raindrop:draw()
	love.graphics.circle("line", self.x, self.y, self.r)
end

return raindrop