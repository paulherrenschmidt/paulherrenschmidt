require 'gosu'

class Player
  attr_reader :score
  def initialize
    @image = Gosu::Image.new("images/xwing.png")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @x -= 4.5
  end

  def turn_right
    @x += 4.5
  end

  def move
    @x %= 640
    @y %= 480
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def collect_stars(stars)
    if stars.reject! {|star| Gosu::distance(@x, @y, star.x, star.y) < 35 } then
      @score += 1
    end
  end

end
