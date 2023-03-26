class Game

  attr_reader :finished 

  def initialize 
    @score    = 0
    @food_x   = rand(GRID_WIDTH)
    @food_y   = rand(GRID_HEIGHT)
    @finished = false
  end 

  def draw
    unless @finish
      Square.new(x: @food_x * GRID_SIZE, y: @food_y * GRID_SIZE, size: GRID_SIZE, color: 'yellow')
    end
    Text.new(text_message, color: 'green', x: 10, y: 10, size: 25)
  end

  def snake_eat_food?(x, y)
    @food_x == x && @food_y == y
  end

  def record_ate
    @score += 1
    @food_x = rand(GRID_WIDTH)
    @food_y = rand(GRID_HEIGHT)
  end

  def finish
    @finished = true
  end

  private 

  def text_message
    if @finished
      "Game over, your score was: #{@score}. Press 'R' to restart"
    else
      "Score: #{@score}"
    end
  end

end