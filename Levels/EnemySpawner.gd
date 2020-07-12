extends Node2D

export(NodePath) var Player_Path
export(NodePath) var tilemap_reference

var enemy = preload("res://Environment/Enemy/Projectile.tscn")
onready var player = get_node(Player_Path)
var map
var playerLoc

func _ready():
	randomize()

func start():
	randomize()
	$respawnTimer.wait_time = 1
	$respawnTimer.start()
	
func stop():
	$respawnTimer.stop()
	
func butcher():
	for node in get_children():
		if !(node is Timer):
			remove_child(node)
			node.queue_free()

func _on_respawnTimer_timeout():
	var location = Vector2()
	var rng = randi()%4 +1
	map = get_node(tilemap_reference)
	playerLoc = map.map_to_world(player.pos)
	
	
	var e = enemy.instance()
	add_child(e)
	
	
	if rng == 1: #1 = top spawn
		location=randomTopSpawn(playerLoc)
		e.position = location
		e.move_down() #enemy should move in this direction once it is spawned
	elif rng == 2: #2 = bottom spawn
		location=randomBottomSpawn(playerLoc)
		e.position = location
		e.move_up()
	elif rng == 3: #3 = left spawn
		location=randomLeftSpawn(playerLoc)
		e.position = location
		e.move_right()
	elif rng == 4: #4 = right spawn
		location=randomRightSpawn(playerLoc)
		e.position = location
		e.move_left()
	
	e.speed = randi()%325 + 75
	
	$respawnTimer.wait_time = max(.01, $respawnTimer.wait_time - .001)
	
	
	
func randomTopSpawn(playerLoc):
	var rngCell = randi()%27 +1
	var location = Vector2()
	
	
	if rngCell >= 1 and rngCell <= 5:
		location.x = playerLoc.x+0
		location.y = playerLoc.y-896
	
	elif rngCell >= 6 and rngCell <= 10:
		location.x = playerLoc.x+128
		location.y = playerLoc.y-896
	
	elif rngCell >= 11 and rngCell <= 15:
		location.x = playerLoc.x-128
		location.y = playerLoc.y-896
	
	elif rngCell == 16:
		location.x = playerLoc.x+384
		location.y = playerLoc.y-896
	
	elif rngCell == 17:
		location.x = playerLoc.x+512
		location.y = playerLoc.y-896
	
	elif rngCell == 18:
		location.x = playerLoc.x+640
		location.y = playerLoc.y-896

	elif rngCell == 19:
		location.x = playerLoc.x+768
		location.y = playerLoc.y-896
		
	elif rngCell == 20:
		location.x = playerLoc.x+896
		location.y = playerLoc.y-896
		
	elif rngCell == 21:
		location.x = playerLoc.x+256
		location.y = playerLoc.y-896
	
	elif rngCell == 22:
		location.x = playerLoc.x-256
		location.y = playerLoc.y-896
	
	elif rngCell == 23:
		location.x = playerLoc.x-384
		location.y = playerLoc.y-896
	
	elif rngCell == 24:
		location.x = playerLoc.x-512
		location.y = playerLoc.y-896
	
	elif rngCell == 25:
		location.x = playerLoc.x-640
		location.y = playerLoc.y-896

	elif rngCell == 26:
		location.x = playerLoc.x-768
		location.y = playerLoc.y-896
		
	elif rngCell == 27:
		location.x = playerLoc.x-896
		location.y = playerLoc.y-896
	
	location.x+=64
	return(location)
	
func randomBottomSpawn(playerLoc):
	var rngCell = randi()%27 +1
	var location = Vector2()
	
	
	if rngCell >= 1 and rngCell <= 5:
		location.x = playerLoc.x+0
		location.y = playerLoc.y+896
	
	elif rngCell >= 6 and rngCell <= 10:
		location.x = playerLoc.x+128
		location.y = playerLoc.y+896
	
	elif rngCell >= 11 and rngCell <= 15:
		location.x = playerLoc.x-128
		location.y = playerLoc.y+896
	
	elif rngCell == 16:
		location.x = playerLoc.x+384
		location.y = playerLoc.y+896
	
	elif rngCell == 17:
		location.x = playerLoc.x+512
		location.y = playerLoc.y+896
	
	elif rngCell == 18:
		location.x = playerLoc.x+640
		location.y = playerLoc.y+896

	elif rngCell == 19:
		location.x = playerLoc.x+768
		location.y = playerLoc.y+896
		
	elif rngCell == 20:
		location.x = playerLoc.x+896
		location.y = playerLoc.y+896
		
	elif rngCell == 21:
		location.x = playerLoc.x+256
		location.y = playerLoc.y+896
	
	elif rngCell == 22:
		location.x = playerLoc.x-256
		location.y = playerLoc.y+896
	
	elif rngCell == 23:
		location.x = playerLoc.x-384
		location.y = playerLoc.y+896
	
	elif rngCell == 24:
		location.x = playerLoc.x-512
		location.y = playerLoc.y+896
	
	elif rngCell == 25:
		location.x = playerLoc.x-640
		location.y = playerLoc.y+896

	elif rngCell == 26:
		location.x = playerLoc.x-768
		location.y = playerLoc.y+896
		
	elif rngCell == 27:
		location.x = playerLoc.x-896
		location.y = playerLoc.y+896
	
	location.x+=64
	return(location)
	
func randomLeftSpawn(playerLoc):
	var rngCell = randi()%26 +1
	var location = Vector2()
	
	if rngCell >= 1 and rngCell <= 5:
		location.y = playerLoc.y+0
		location.x = playerLoc.x-1216
	
	elif rngCell >= 6 and rngCell <= 10:
		location.y = playerLoc.y+128
		location.x = playerLoc.x-1216
	
	elif rngCell == 16:
		location.y = playerLoc.y+256
		location.x = playerLoc.x-1216
	
	elif rngCell == 17:
		location.y = playerLoc.y+384
		location.x = playerLoc.x-1216
	
	elif rngCell == 18:
		location.y = playerLoc.y+512
		location.x = playerLoc.x-1216
	
	elif rngCell == 19:
		location.y = playerLoc.y+640
		location.x = playerLoc.x-1216

	elif rngCell == 20:
		location.y = playerLoc.y+768
		location.x = playerLoc.x-1216
		
	elif rngCell >= 10 and rngCell <= 15:
		location.y = playerLoc.y-128
		location.x = playerLoc.x-1216
	
	elif rngCell == 21:
		location.y = playerLoc.y-256
		location.x = playerLoc.x-1216
	
	elif rngCell == 22:
		location.y = playerLoc.y-384
		location.x = playerLoc.x-1216
	
	elif rngCell == 23:
		location.y = playerLoc.y-512
		location.x = playerLoc.x-1216
	
	elif rngCell == 24:
		location.y = playerLoc.y-640
		location.x = playerLoc.x-1216
	
	elif rngCell == 25:
		location.y = playerLoc.y-768
		location.x = playerLoc.x-1216

	elif rngCell == 26:
		location.y = playerLoc.y-896
		location.x = playerLoc.x-1216
	
	location.y+=64
	return(location)
	
func randomRightSpawn(playerLoc):
	var rngCell = randi()%26 +1
	var location = Vector2()
	
	if rngCell >= 1 and rngCell <= 5:
		location.y = playerLoc.y+0
		location.x = playerLoc.x+1216
	
	elif rngCell >= 6 and rngCell <= 10:
		location.y = playerLoc.y+128
		location.x = playerLoc.x+1216
	
	elif rngCell == 16:
		location.y = playerLoc.y+256
		location.x = playerLoc.x+1216
	
	elif rngCell == 17:
		location.y = playerLoc.y+384
		location.x = playerLoc.x+1216
	
	elif rngCell == 18:
		location.y = playerLoc.y+512
		location.x = playerLoc.x+1216
	
	elif rngCell == 19:
		location.y = playerLoc.y+640
		location.x = playerLoc.x+1216

	elif rngCell == 20:
		location.y = playerLoc.y+768
		location.x = playerLoc.x+1216
		
	elif rngCell >= 10 and rngCell <= 15:
		location.y = playerLoc.y-128
		location.x = playerLoc.x+1216
	
	elif rngCell == 21:
		location.y = playerLoc.y-256
		location.x = playerLoc.x+1216
	
	elif rngCell == 22:
		location.y = playerLoc.y-384
		location.x = playerLoc.x+1216
	
	elif rngCell == 23:
		location.y = playerLoc.y-512
		location.x = playerLoc.x+1216
	
	elif rngCell == 24:
		location.y = playerLoc.y-640
		location.x = playerLoc.x+1216
	
	elif rngCell == 25:
		location.y = playerLoc.y-768
		location.x = playerLoc.x+1216

	elif rngCell == 26:
		location.y = playerLoc.y-896
		location.x = playerLoc.x+1216
	
	location.y+=64

	return(location)
