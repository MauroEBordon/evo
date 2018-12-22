
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

    carrots = Carrots(10)
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

    rabbit:goals(carrots)
    rabbit:update()
    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    rabbit:render()
    carrots:render()
    push:finish()
end
