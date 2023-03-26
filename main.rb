require 'ruby2d'
require_relative 'game'
require_relative 'snake'

set background: 'navy'
set fps_cap: 20

# width = 640 / 20 = 32 
# height = 480 / 20 = 24

GRID_SIZE = 20
GRID_WIDTH = Window.width / GRID_SIZE
GRID_HEIGHT = Window.height / GRID_SIZE

snake = Snake.new
game = Game.new

update do
  clear 

  unless game.finished
    snake.move
  end

  snake.draw
  game.draw

  if game.snake_eat_food?(snake.x, snake.y)
    game.record_ate 
    snake.grow
  end

  if snake.hit_itself?
    game.finish
  end
end

on :key_down do |event|
  if %w[up down left right].include?(event.key)
    if snake.can_change_direction_to?(event.key)
      snake.direction = event.key
    end
  elsif event.key == 'r' && game.finished
    snake = Snake.new
    game = Game.new
  end
end

show