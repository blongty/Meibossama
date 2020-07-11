extends Node2D
export(NodePath) var Player_Path

var enemy = preload("res://Environment/Enemy/Projectile.tscn")
onready var player = get_node(Player_Path)

func _ready():
	randomize()
	

func _on_respawnTimer_timeout():
	var location = Vector2()
	var rng = randi()%4 +1
	var playerLoc = player.position
	
	
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
	
	$respawnTimer.wait_time = max(.01, $respawnTimer.wait_time - .001)
	
	
	
func randomTopSpawn(playerLoc):
	var rngCell = randi()%15 +1
	var location = Vector2()
	
	
	if rngCell == 1:
		location.x = playerLoc.x+0
		location.y = playerLoc.y-896
	
	elif rngCell == 2:
		location.x = playerLoc.x+128
		location.y = playerLoc.y-896
	
	elif rngCell == 3:
		location.x = playerLoc.x+256
		location.y = playerLoc.y-896
	
	elif rngCell == 4:
		location.x = playerLoc.x+384
		location.y = playerLoc.y-896
	
	elif rngCell == 5:
		location.x = playerLoc.x+512
		location.y = playerLoc.y-896
	
	elif rngCell == 6:
		location.x = playerLoc.x+640
		location.y = playerLoc.y-896

	elif rngCell == 7:
		location.x = playerLoc.x+768
		location.y = playerLoc.y-896
		
	elif rngCell == 8:
		location.x = playerLoc.x+896
		location.y = playerLoc.y-896
		
	elif rngCell == 9:
		location.x = playerLoc.x-128
		location.y = playerLoc.y-896
	
	elif rngCell == 10:
		location.x = playerLoc.x-256
		location.y = playerLoc.y-896
	
	elif rngCell == 11:
		location.x = playerLoc.x-384
		location.y = playerLoc.y-896
	
	elif rngCell == 12:
		location.x = playerLoc.x-512
		location.y = playerLoc.y-896
	
	elif rngCell == 13:
		location.x = playerLoc.x-640
		location.y = playerLoc.y-896

	elif rngCell == 14:
		location.x = playerLoc.x-768
		location.y = playerLoc.y-896
		
	elif rngCell == 15:
		location.x = playerLoc.x-896
		location.y = playerLoc.y-896
	
	return(location)
	
func randomBottomSpawn(playerLoc):
	var rngCell = randi()%15 +1
	var location = Vector2()
	
	
	if rngCell == 1:
		location.x = playerLoc.x+0
		location.y = playerLoc.y+896
	
	elif rngCell == 2:
		location.x = playerLoc.x+128
		location.y = playerLoc.y+896
	
	elif rngCell == 3:
		location.x = playerLoc.x+256
		location.y = playerLoc.y+896
	
	elif rngCell == 4:
		location.x = playerLoc.x+384
		location.y = playerLoc.y+896
	
	elif rngCell == 5:
		location.x = playerLoc.x+512
		location.y = playerLoc.y+896
	
	elif rngCell == 6:
		location.x = playerLoc.x+640
		location.y = playerLoc.y+896

	elif rngCell == 7:
		location.x = playerLoc.x+768
		location.y = playerLoc.y+896
		
	elif rngCell == 8:
		location.x = playerLoc.x+896
		location.y = playerLoc.y+896
		
	elif rngCell == 9:
		location.x = playerLoc.x-128
		location.y = playerLoc.y+896
	
	elif rngCell == 10:
		location.x = playerLoc.x-256
		location.y = playerLoc.y+896
	
	elif rngCell == 11:
		location.x = playerLoc.x-384
		location.y = playerLoc.y+896
	
	elif rngCell == 12:
		location.x = playerLoc.x-512
		location.y = playerLoc.y+896
	
	elif rngCell == 13:
		location.x = playerLoc.x-640
		location.y = playerLoc.y+896

	elif rngCell == 14:
		location.x = playerLoc.x-768
		location.y = playerLoc.y+896
		
	elif rngCell == 15:
		location.x = playerLoc.x-896
		location.y = playerLoc.y+896
	
	return(location)
	
func randomLeftSpawn(playerLoc):
	var rngCell = randi()%14 +1
	var location = Vector2()
	
	if rngCell == 1:
		location.y = playerLoc.y+0
		location.x = playerLoc.x-1216
	
	elif rngCell == 2:
		location.y = playerLoc.y+128
		location.x = playerLoc.x-1216
	
	elif rngCell == 3:
		location.y = playerLoc.y+256
		location.x = playerLoc.x-1216
	
	elif rngCell == 4:
		location.y = playerLoc.y+384
		location.x = playerLoc.x-1216
	
	elif rngCell == 5:
		location.y = playerLoc.y+512
		location.x = playerLoc.x-1216
	
	elif rngCell == 6:
		location.y = playerLoc.y+640
		location.x = playerLoc.x-1216

	elif rngCell == 7:
		location.y = playerLoc.y+768
		location.x = playerLoc.x-1216
		
	elif rngCell == 8:
		location.y = playerLoc.y-128
		location.x = playerLoc.x-1216
	
	elif rngCell == 9:
		location.y = playerLoc.y-256
		location.x = playerLoc.x-1216
	
	elif rngCell == 10:
		location.y = playerLoc.y-384
		location.x = playerLoc.x-1216
	
	elif rngCell == 11:
		location.y = playerLoc.y-512
		location.x = playerLoc.x-1216
	
	elif rngCell == 12:
		location.y = playerLoc.y-640
		location.x = playerLoc.x-1216
	
	elif rngCell == 13:
		location.y = playerLoc.y-768
		location.x = playerLoc.x-1216

	elif rngCell == 14:
		location.y = playerLoc.y-896
		location.x = playerLoc.x-1216

	return(location)
	
func randomRightSpawn(playerLoc):
	var rngCell = randi()%14 +1
	var location = Vector2()
	
	if rngCell == 1:
		location.y = playerLoc.y+64
		location.x = playerLoc.x+1216
	
	elif rngCell == 2:
		location.y = playerLoc.y+192
		location.x = playerLoc.x+1216
	
	elif rngCell == 3:
		location.y = playerLoc.y+320
		location.x = playerLoc.x+1216
	
	elif rngCell == 4:
		location.y = playerLoc.y+448
		location.x = playerLoc.x+1216
	
	elif rngCell == 5:
		location.y = playerLoc.y+576
		location.x = playerLoc.x+1216
	
	elif rngCell == 6:
		location.y = playerLoc.y+704
		location.x = playerLoc.x+1216

	elif rngCell == 7:
		location.y = playerLoc.y+832
		location.x = playerLoc.x+1216
		
	elif rngCell == 8:
		location.y = playerLoc.y-64
		location.x = playerLoc.x+1216
	
	elif rngCell == 9:
		location.y = playerLoc.y-192
		location.x = playerLoc.x+1216
	
	elif rngCell == 10:
		location.y = playerLoc.y-320
		location.x = playerLoc.x+1216
	
	elif rngCell == 11:
		location.y = playerLoc.y-448
		location.x = playerLoc.x+1216
	
	elif rngCell == 12:
		location.y = playerLoc.y-576
		location.x = playerLoc.x+1216
	
	elif rngCell == 13:
		location.y = playerLoc.y-704
		location.x = playerLoc.x+1216

	elif rngCell == 14:
		location.y = playerLoc.y-832
		location.x = playerLoc.x+1216

	location.y = location.y+64
	return(location)
