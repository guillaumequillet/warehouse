=begin
a rack can be accessed from 4 various points : 
- from left
- from right
- from top
- from bottom
=end

class Rack
  def initialize(x, y, width, height, access)
    @x, @y, @width, @height, @access = x, y, width, height, access
  end

  def draw_blueprint(blueprint)
    bg_color = blueprint.bg_color
    border_color = blueprint.border_color
    border_size = blueprint.border_size + 2
    tile_size = blueprint.tile_size
    font = blueprint.font

    case @access
    when :bottom
      Gosu.draw_rect(@x * tile_size, @y * tile_size, @width * tile_size, tile_size, border_color)
      Gosu.draw_rect(@x * tile_size + border_size, @y * tile_size + border_size, @width * tile_size - border_size * 2, tile_size - border_size * 2, bg_color)
      @width.times do |x|
        text = @height.to_s
        font.draw_text(text, (@x + x) * tile_size + 10, @y * tile_size + 6, 0)
      end
    when :top
      Gosu.draw_rect(@x * tile_size, @y * tile_size, @width * tile_size, tile_size, border_color)
      Gosu.draw_rect(@x * tile_size + border_size, @y * tile_size + border_size, @width * tile_size - border_size * 2, tile_size - border_size * 2, bg_color)
      @width.times do |x|
        text = @height.to_s
        font.draw_text(text, (@x + x) * tile_size, @y * tile_size, 0, -1, -1)
      end
    end
  end
end