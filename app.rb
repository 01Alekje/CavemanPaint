require 'ruby2d'
require 'chunky_png'
require_relative 'canvas'

canvasWidth = 500
canvasHeight = 500
canvas = Canvas.new(canvasWidth, canvasHeight)
mouseDown = false
inBounds = false

tick = 0
set background: 'random'

update do
    if tick % 2 == 0
        Image.new(
            './data/images/canvas.png',
            x: 0, y: 0,
            width: canvasWidth, height: canvasHeight,
            color: [250, 250, 250, 10],
            z: 10
        )
        #canvas.saveCanvas() // makes it feel really laggy, but a bit easier to draw. Also leaves holes every reload...
        tick = 0
    end
    tick += 1
end

on :mouse do |event|
    if event.type == :down
        mouseDown = true
    elsif event.type == :up
        mouseDown = false
        canvas.saveCanvas()
    elsif event.y + 1 >= canvasHeight or event.x + 1 >= canvasWidth or event.y - 1 <= 0 or event.x - 1 <= 0
        inBounds = false
    else
        inBounds = true
    end
    if mouseDown and inBounds then canvas.drawPixel(event.x, event.y, 2, 'red') end
end

show