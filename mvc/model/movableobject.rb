class MovableObject
    def initialize (x, y, width, height)
        @x = x
        @y = y
        @width = width
        @height = height
    end

    def getX ()
        @x
    end

    def getY ()
        @y
    end

    def setX (nx)
        @x = nx
    end

    def setY (ny)
        @y = ny
    end
end