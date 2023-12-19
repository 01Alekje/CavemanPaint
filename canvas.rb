class Canvas
    def initialize (width, height)
        @width = width
        @height = height
        @content = []

        #init canvas
        @canvas = ChunkyPNG::Image.new(width, height, ChunkyPNG::Color::WHITE)
        @canvas.save('./data/images/canvas.png', color_mode: ChunkyPNG::COLOR_TRUECOLOR)
    end
    
    def drawPixel (x, y, thickness, color)
        i = -thickness
        while i <= thickness
            j = - thickness
            while j <= thickness
                if x - j < 0 or x - j >= @width or y - i < 0 or y - i >= @height
                    @canvas[x , y] = ChunkyPNG::Color(color)
                else
                    @canvas[x - j, y - i] = ChunkyPNG::Color(color)
                end
                j += 1
            end
            i += 1
        end
    end

    def saveCanvas ()
        @canvas.save('./data/images/canvas.png', color_mode: ChunkyPNG::COLOR_TRUECOLOR)
    end
end