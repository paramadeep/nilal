require 'chunky_png'

class Chunk
  def compare actual_file,expexcted_file,diff_file
    images = [
      ChunkyPNG::Image.from_file(actual_file),
      ChunkyPNG::Image.from_file(expexcted_file)
    ]

    diff = 0
    images.first.height.times do |y|
      images.first.row(y).each_with_index do |pixel, x|
        r_diff = r(pixel) + r(images.last[x,y]) - 2 * [r(pixel), r(images.last[x,y])].min
        g_diff = g(pixel) + g(images.last[x,y]) - 2 * [g(pixel), g(images.last[x,y])].min
        b_diff = b(pixel) + b(images.last[x,y]) - 2 * [b(pixel), b(images.last[x,y])].min
        images.last[x,y] = rgb(r_diff,g_diff,b_diff)
        diff = r_diff + g_diff+b_diff
      end
    end
    images.last.save(diff_file)
    diff == 0
  end

  def compare_image file_name
  end

  private
  def r (x)
    ChunkyPNG::Color.r x
  end

  def g (x) 
    ChunkyPNG::Color.g x
  end

  def b (x)
    ChunkyPNG::Color.b x
  end

  def rgb (r1,g1,b1) 
    ChunkyPNG::Color.rgb r1,g1,b1
  end

end

