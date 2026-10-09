-- constants
local DROPFRAMES = 11

local raindrop = {}
raindrop.__index = raindrop

function raindrop.new()

    local drop = {}
    -- inhereit raindrop table
    setmetatable(drop, raindrop)
    
    -- initial state
    drop.x = love.math.random(love.graphics.getWidth())
    drop.y = 0 - love.math.random(love.graphics.getHeight())
    drop.target_y = love.math.random(love.graphics.getHeight())
    drop.radius = 3 -- radius
    drop.time = 0 -- time
    drop.speed = 500

    return drop
end

function raindrop:update(dt)
    -- move raindrop down if not past target
    if self.y < self.target_y then
        self.y = self.y + self.speed * dt
    -- once past target simulate a splash, increase time
    else
        self.radius = self.radius + 1
        self.time = self.time + 1
    end

    -- check if splash has exceeded DROPFRAMES, if so reset
    if self.time > DROPFRAMES then
        self.time = 0
        self.radius = 3
        self.x = love.math.random(love.graphics.getWidth())
        self.y = 0
        self.target_y = love.math.random(love.graphics.getHeight())
    end

end

function raindrop:draw()
    -- draw raindrop as simple circle
    love.graphics.circle("line", self.x, self.y, self.radius)
end

return raindrop