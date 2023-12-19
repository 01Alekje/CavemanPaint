class Canvas
    def initialize (width, height)
        @width = width
        @height = height
        @content = []

        #init canvas
        @canvas = ChunkyPNG::Image.new(width, height, ChunkyPNG::Color::WHITE)
        @canvas.save('./data/images/canvas.png', color_mode: ChunkyPNG::COLOR_TRUECOLOR)
        #@canvas = ChunkyPNG::Image.from_file('./data/images/canvas.png')
    end
    
    def drawPixel (x, y)
        @canvas[x, y] = ChunkyPNG::Color('red')
    end

    def saveCanvas ()
        @canvas.save('./data/images/canvas.png', color_mode: ChunkyPNG::COLOR_TRUECOLOR)
    end
end