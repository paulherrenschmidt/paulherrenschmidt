require 'gosu'
#install gem gozu dans le Terminal


require_relative "player"
require_relative "star"

class GameWindow < Gosu::Window
  module ZOrder
    Background, Stars, Player, UI = *0..3
  end

  def initialize
    super 640, 480
    self.caption = "Gosu Tutorial Game"
    @background_image = Gosu::Image.new("images/space.png", :tileable => true)

    @player = Player.new
    @player.warp(320, 450)

    @star_anim = Gosu::Image::load_tiles("images/star.png", 25, 25)
    @stars = Array.new

    @font = Gosu::Font.new(20)

  end

  def update
      if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
      @player.turn_left
    end
    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
      @player.turn_right
    end
    @player.move
    @player.collect_stars(@stars)
    if rand(100) < 4 and @stars.size < 25 then
      @stars.push(Star.new(@star_anim))
    end
    @stars.each { |star| star.fall}
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, ZOrder::Background)
    @stars.each { |star| star.draw }
    @font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

end

window = GameWindow.new
window.show

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

class Star
  attr_reader :x, :y

  module ZOrder
    Background, Stars, Player, UI = *0..3
  end

  def initialize(animation)
    @animation = animation
    @color = Gosu::Color.new(0xff_000000)
    @color.red = rand(256 - 40) + 40
    @color.green = rand(256 - 40) + 40
    @color.blue = rand(256 - 40) + 40
    @x = rand * 640
    @y = rand * 480
  end

  def fall
  @y += 4.5
  end

  def draw
    img = @animation[Gosu::milliseconds / 100 % @animation.size];
    img.draw(@x - img.width / 2.0, @y - img.height / 2.0,
        ZOrder::Stars, 1, 1, @color, :add)
  end
end
