require 'ruby2d'
require 'chunky_png'
require_relative 'canvas'
require_relative 'pen'

# non ruby2d-data initialization
canvasWidth = 1000
canvasHeight = 1000
canvas = Canvas.new(canvasWidth, canvasHeight)
mouseDown = false
inBounds = false
sideBarWidth = 200
tick = 0

@pen = Pen.new()

# ruby2d data initialization

set resizable: false, height: canvasHeight, width: canvasWidth + 200, background: 'random'

# initializing buttons in ruby2d

Rectangle.new(
  x: 25, y: 25,
  width: 62, height: 40,
  color: 'white',
  z: 20
)

Text.new(
    '3px',
    x: 30, y: 30,
    style: 'bold',
    size: 20,
    color: 'black',
    z: 21
)

Rectangle.new(
  x: 50 + 62, y: 25,
  width: 62, height: 40,
  color: 'white',
  z: 20
)

Text.new(
    '7px',
    x: 55 + 62, y: 30,
    style: 'bold',
    size: 20,
    color: 'black',
    z: 21
)

Rectangle.new(
  x: 25, y: 25 + 40 + 25,
  width: 62, height: 40,
  color: 'white',
  z: 20
)

Text.new(
    '15px',
    x: 30, y: 30 + 40 + 25,
    style: 'bold',
    size: 20,
    color: 'black',
    z: 21
)

update do
    if tick % 2 == 0
        Image.new(
            './data/images/canvas.png',
            x: 200, y: 0,
            width: canvasWidth, height: canvasHeight,
            color: [250, 250, 250, 10],
            z: 10
        )
        #canvas.saveCanvas() // makes it feel really laggy, but a bit easier to draw. Also leaves holes every reload...
        tick = 0
    end
    tick += 1
end

# Handles button clicks outside of canvas
def clickSelected ()
    if Window.mouse_x <= 25 + 62 and Window.mouse_x >= 25
        if Window.mouse_y <= 25 + 40 and Window.mouse_y >= 25
            @pen.setBroadness(1)
        end
    end
    if Window.mouse_x <= 50 + 62 + 62 and Window.mouse_x >= 50 + 62
        if Window.mouse_y <= 25 + 40 and Window.mouse_y >= 25
            @pen.setBroadness(6)
        end
    end
    if Window.mouse_x <= 25 + 62 and Window.mouse_x >= 25
        if Window.mouse_y <= 25 + 40 + 25 + 40 and Window.mouse_y >= 25 + 40 + 25
            @pen.setBroadness(14)
        end
    end
end

on :mouse do |event|
    if event.type == :down
        mouseDown = true
        clickSelected()
    elsif event.type == :up
        mouseDown = false
        canvas.saveCanvas()
    elsif event.y + 1 >= canvasHeight or event.x - sideBarWidth + 1 >= canvasWidth or event.y - 1 <= 0 or event.x - sideBarWidth - 1 <= 0
        inBounds = false
    else
        inBounds = true
    end
    if mouseDown and inBounds then canvas.drawPixel(event.x - sideBarWidth, event.y, @pen.getBroadness(), 'red') end
end

show