require_relative 'movableobject'

class Square < MovableObject
    def initialize (x, y, width, height)
        super(x, y, width, height)
        Square.new(
            x: 100, y: 200,
            size: 125,
            color: 'blue',
            z: 10
        )
    end
end