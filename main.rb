require 'chunky_png'

def drawSquare (x, y, width)
    png = ChunkyPNG::Image.new(16, 16, ChunkyPNG::Color::WHITE)
    png.save('saved_images/painted.png', :interlace => true)
    header_data = nil
    image_height = nil
    image_width = nil
    temp = ChunkyPNG::Datastream.from_file('saved_images/painted.png')
    temp.each_chunk { |chunk| if chunk.type == "IHDR" then header_data = chunk end }
    image_height = header_data.height
    image_width = header_data.width

    if x + width > image_width
        return "image width too small for argument width = " + String(width)
    elsif y + width > image_height
        return "image height too small for argument height = " + String(width)
    end

    oldX = x
    while x < oldX + width
        png[x, y] = ChunkyPNG::Color('black @ 0.5')
        x += 1
    end
    x = oldX
    while x < oldX + width
        png[x, y + width - 1] = ChunkyPNG::Color('black @ 0.5')
        x += 1
    end
    bla = y
    while y <= width
        png[oldX, y] = ChunkyPNG::Color('black @ 0.5')
        png[x - 1, y] = ChunkyPNG::Color('black @ 0.5')
        y += 1
    end
    png.save('saved_images/painted.png')
    puts "success!"
end

puts drawSquare(1, 1, 14)

puts "did stuff"