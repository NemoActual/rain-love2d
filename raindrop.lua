local raindrop = {}
raindrop.__index = raindrop

function raindrop.new()
    -- initial state
    local drop = {}
    -- inhereit raindrop table
    setmetatable(drop, raindrop)
    drop.x = love.math.random(love.graphics.getWidth())
    drop.y = love.math.random(love.graphics.getHeight())
    drop.target_y = love.math.random(love.graphics.getHeight())
    drop.radius = 3 -- radius
    drop.time = 0 -- time
    drop.hit = false

    return drop
end

function raindrop:update(dt)
    -- move raindrop down
    if not self.hit then self.y = self.y + 7 end

    -- check if drop has past its target
    if self.y > self.target_y and not self.hit then
        self.hit = true
    end

    -- if hit increase radius and time
    if self.hit then
        self.time = self.time + 1 
        self.radius =  self.radius + 1
    end

    -- reset finally after 10 frames
    if self.time > 10 then
        self.x = love.math.random(love.graphics.getWidth())
        self.y = 0
        self.target_y = love.math.random(love.graphics.getHeight())
        self.time = 0
        self.radius = 3
        self.hit = false
    end
end

function raindrop:draw()
    -- draw raindrop as simple circle
    love.graphics.circle("line", self.x, self.y, self.radius)
end

return raindrop