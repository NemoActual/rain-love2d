-- constants
local FGCOLOR = {198 / 255, 186 / 255, 172 / 255, 1}
local BGCOLOR = {30 / 255, 28 / 255, 50 / 255, 1}
local MAXDROPS = 256

local raindrop = require "raindrop"

function love.load()
    -- set fullscreen
    love.window.setFullscreen(true)

    -- set random seed
    love.math.setRandomSeed(os.time())

    -- set colors
    love.graphics.setBackgroundColor(BGCOLOR)
    love.graphics.setColor(FGCOLOR)
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- create array of drops
    drops = {}
    for i = 1, MAXDROPS do
        drops[i] = raindrop.new()
    end

end

function love.update(dt)
    -- update drops
    for i = 1, MAXDROPS do
        drops[i]:update(dt)
    end
end

function love.draw()
    -- draw drops
    for i = 1, MAXDROPS do
        drops[i]:draw()
    end

end

-- handle key input
function love.keypressed(key)
    -- quit if user press q or escape
    if key == "q" or key == "escape" then
        love.event.quit()
    end
end