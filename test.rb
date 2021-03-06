require_relative 'lib/window'

class Window_Test < Window

  def initialize(title='Window', width=0, height=0)
    super(title, width, height)

    @sprite = Sprite.new('obama_sprite.png')
    @sprites = []
    3000.times do
      @sprites << Sprite.new('crate.png')
      @sprites.last.x = rand(300)
      @sprites.last.y = rand(300)
    end
  end

  def update
    @sprite.y -= 4 if Input.pressed? GLFW_KEY_UP
    @sprite.y += 4 if Input.pressed? GLFW_KEY_DOWN
    @sprite.x -= 4 if Input.pressed? GLFW_KEY_LEFT
    @sprite.x += 4 if Input.pressed? GLFW_KEY_RIGHT


    @sprite.opacity -= 0.1 if Input.pressed? 'q'
    @sprite.opacity += 0.1 if Input.pressed? 'w'

    @sprites.each do |sprite|
      sprite.draw
      sprite.x += rand(-1..1)
      sprite.y += rand(-1..1)
    end
    @sprite.draw
  end

end

@window = Window_Test.new
@window.show
