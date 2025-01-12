class Blueprint
  attr_reader :tile_size, :bg_color, :border_color, :border_size, :font
  def initialize(tile_size = 16, width = 0, height = 0)
    @tile_size, @width, @height = tile_size, width, height
    setup_colors
    create_graphics
  end
  
  def setup_colors
    @font = Gosu::Font.new((@tile_size * 0.8).floor, {name: Gosu::default_font_name})
    @bg_color = Gosu::Color.new(255, 0, 84, 170)
    @border_color = Gosu::Color.new(255, 167, 226, 255)
    @border_size = 1
  end

  def create_graphics
    create_empty_tile
    create_floor_bg
  end

  def create_empty_tile
    @empty_tile_image = Gosu.render(@tile_size, @tile_size, retro: true) do
      Gosu.draw_rect(0, 0, @tile_size, @tile_size, @border_color)
      Gosu.draw_rect(@border_size, @border_size, @tile_size - @border_size, @tile_size - @border_size, @bg_color)
    end
  end

  def create_floor_bg
    @floor_bg_image = Gosu.render(@tile_size * @width, @tile_size * @height, retro: true) do
      @height.times do |y|
        @width.times do |x|
          @empty_tile_image.draw(x * @tile_size, y * @tile_size, 0)
        end
      end
    end
  end

  def draw
    @floor_bg_image.draw(0, 0, 0)
  end
end