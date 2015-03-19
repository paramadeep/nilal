require 'chunky_png'

module Chunk
  extend self

  def matches? actual_file,expexcted_file,diff_file
    images = [
      ChunkyPNG::Image.from_file(actual_file),
      ChunkyPNG::Image.from_file(expexcted_file)
    ]
    return false unless images.first.height == images.last.height && images.first.width == images.last.width
    image_diff_count = compute_image_difference images.first,images.last,diff_file
    image_diff_count == 0
  end

  private

  def compute_image_difference image1,image2,diff_image
    diff = 0
    image1.height.times do |y|
      image1.row(y).each_with_index do |pixel, x|
        r_diff = r(pixel) + r(image2[x,y]) - 2 * [r(pixel), r(image2[x,y])].min
        g_diff = g(pixel) + g(image2[x,y]) - 2 * [g(pixel), g(image2[x,y])].min
        b_diff = b(pixel) + b(image2[x,y]) - 2 * [b(pixel), b(image2[x,y])].min
        image2[x,y] = rgb(r_diff,g_diff,b_diff)
        diff = diff + r_diff + g_diff+b_diff
      end
    end
    image2.save(diff_image)
    return diff
  end

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

