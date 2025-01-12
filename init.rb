require 'gosu'

Dir.glob('lib/*.rb').each {|fn| require_relative fn}

class Window < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = 'Warehouse'

    @blueprint = Blueprint.new(32, 20, 20)
  end

  def button_down(id)
    super 
    close! if id == Gosu::KB_ESCAPE
  end

  def update

  end

  def draw
    @blueprint.draw
  end
end

Window.new.show