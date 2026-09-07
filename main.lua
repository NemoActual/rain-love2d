-- constants
local FGCOLOR = {198 / 255, 186 / 255, 172 / 255, 1}
local BGCOLOR = {30 / 255, 28 / 255, 50 / 255, 1}
local MAXDROPS = 256

local raindrop = require "raindrop"

function love.load()
    love.window.setFullscreen(true)
    -- timer 
    timer = 0
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
    -- update timer
    timer = timer + dt
    -- update drops
    for i = 1, MAXDROPS do
        drops[i]:update()
    end
end

function love.draw()
    if timer > 2.5 then
        for i = 1, MAXDROPS do
            drops[i]:draw()
        end
    else
        love.graphics.print("Rain by Nemo", love.graphics.getWidth() / 2 - 128, love.graphics.getHeight() / 2, 0, 10)
    end
end

-- handle key input
function love.keypressed(key)
    -- quit if user press q or escape
    if key == "q" or key == "escape" then
        love.event.quit()
    end
end