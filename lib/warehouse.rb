=begin
To simplify, a rack will always have bins of 1x1 tile size
origin will always be on the bottom of the rack

Aisles must be at least 3 tiles wide, so that forklifts can operate


=end


class Warehouse
  def initialize(width = 0, height = 0)
    @width, @height = width, height
    @blueprint_tile_size = 32
    @blueprint = Blueprint.new(@blueprint_tile_size, @width, @height)
    @racks = []
  end

  def add_rack(rack)
    if rack.is_a?(Rack)
      @racks.push rack
    else
      raise("Can't add a #{rack.class} object to racks")
    end
  end

  def draw_blueprint
    @blueprint.draw
    @racks.each {|rack| rack.draw_blueprint(@blueprint)}
  end
end