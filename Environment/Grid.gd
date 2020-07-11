extends TileMap

func generate_tiles(pos : Vector2, mode: int):
	if mode == 0: # up
		for i in range(-8, 9):
			set_cellv(pos + Vector2(i, -4), 0)	# sets the tile
			set_cellv(pos + Vector2(i, 5), -1)	# deletes tiles
	
	elif mode == 1: # right
		for i in range(-4, 5):
			set_cellv(pos + Vector2(7, i), 0)
			set_cellv(pos + Vector2(-8, i), -1)
	
	elif mode == 2: # down
		for i in range(-8, 9):
			set_cellv(pos + Vector2(i, 4), 0)
			set_cellv(pos + Vector2(i, -5), -1)
	
	elif mode == 3: # left
		for i in range(-4, 5):
			set_cellv(pos + Vector2(-7, i), 0)
			set_cellv(pos + Vector2(8, i), -1)
