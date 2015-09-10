require_relative 'lib/game'

game = Game.new
game.debug_junctions = true

game.add_vehicle(100, 100, 45, 'car')

#game.add_road(100, 100, 100, 300)
game.add_road(100, 100, 200, 100)
game.add_road(200, 100, 200, 400)
game.add_road(200, 100, 400, 100)
#game.add_road(100, 300, 400, 300)
#game.add_road(400, 100, 400, 300)

game.show