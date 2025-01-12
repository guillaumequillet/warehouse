require 'gosu'

Dir.glob('lib/*.rb').each {|fn| require_relative fn}

class Window < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = 'Warehouse'

    @warehouse = Warehouse.new(20, 20)
    
    @racks = []
    @racks.push Rack.new(4, 4, 3, 4, :bottom)
    @racks.push Rack.new(4, 3, 3, 4, :top)
    @racks.each {|rack| @warehouse.add_rack(rack)}
  end

  def button_down(id)
    super 
    close! if id == Gosu::KB_ESCAPE
  end

  def update

  end

  def draw
    @warehouse.draw_blueprint
  end
end

Window.new.show