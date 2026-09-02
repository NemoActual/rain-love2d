-- constants
local MAXDROPS = 128

-- lua uses 0.0-1.0 rgb values can divide normal rgb by 255
-- R G B A
local BGCOLOR = {17 / 255, 12 / 255, 24 / 255, 1}
local FGCOLOR = {195 / 255, 220 / 255, 229 / 255, 1}

-- import modules
local raindrop = require "raindrop"
local splash = require "splash"

function love.load()

	-- set random seed
	math.randomseed(os.time())
	
	-- set colors
	love.graphics.setBackgroundColor(BGCOLOR)
	love.graphics.setColor(FGCOLOR)
	
	-- generate array of rain drops
	drops = {}
	for i = 1, MAXDROPS do
		drops[i] = raindrop.new()
	end
	-- generate splashes
	splashes = {}
	for i = 1, MAXDROPS do
		splashes[i] = splash.new(-15, -15)
	end

end

function love.update(dt)
	-- loop over drops and update
	for i = 1, MAXDROPS do
		drops[i]:update(dt)
		-- create a splash when drop dies
		if drops[i].a == false then
			splashes[i].x = drops[i].hx
			splashes[i].y = drops[i].hy
			splashes[i].t = 0
			splashes[i].r = 0
			splashes[i].a = true
		end
	end
	-- loop over splashes and update
	for i = 1, MAXDROPS do
		splashes[i]:update()
	end
end

function love.draw()
	-- loop over drops and draw
	for i = 1, MAXDROPS do
		drops[i]:draw()
	end
	-- loop over splashes and draw
	for i = 1, MAXDROPS do
		splashes[i]:draw()
	end
end