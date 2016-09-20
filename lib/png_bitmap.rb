require 'chunky_png'

class PngBitmap

  def to_bitmap path
    img = ChunkyPNG::Image.from_file(path)
    height = img.dimension.height
    width = img.dimension.width
    arr = []
    height.times do |y|
      width.times do |x|
        arr << (img[x, y] == 255 ? 1 : 0)
      end
    end
    {
      height: height,
      width: width,
      data: arr
    }
  end

end
