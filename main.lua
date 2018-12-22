
require 'src/Dependencies'

function love.load()
    love.window.setTitle('Stering')
    love.graphics.setDefaultFilter('nearest', 'nearest')
    math.randomseed(os.time())

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })

    carrots = Food(15, 70)
    shrums = Food(15, -50)
    rabbit = Rabbit(500,350)
    love.keyboard.keysPressed = {}

end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end

    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()
    mouse = MVector(mouseX, mouseY)
    rabbit:eats(shrums)
    rabbit:eats(carrots)
    rabbit:update()
    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    rabbit:render()
    love.graphics.setColor(0, 1, 0, 1)
    carrots:render()
    love.graphics.setColor(1, 0, 0, 1)
    shrums:render()
    love.graphics.reset()
    push:finish()
end
