extends KinematicBody2D

export(NodePath) var tilemap_reference
export(bool) var debug_movement

var location = Vector2()
var speed = 128
var pos = Vector2(0,0)

var map

func _ready():
	map = get_node(tilemap_reference)
	if map != null:
		location = map.map_to_world(Vector2(0,0)) + Vector2(64, 64)
		set_global_position(location)
	else:
		location == get_position()
		print("Warning: If player is in actual game, make sure Tilemap Reference is assigned, otherwise grid generation will not function.")

func _physics_process(delta):
	if debug_movement:
		if Input.is_action_just_pressed("ui_up"):
			move_up()
		elif Input.is_action_just_pressed("ui_down"):
			move_down()
		elif Input.is_action_just_pressed("ui_right"):
			move_right()
		elif Input.is_action_just_pressed("ui_left"):
			move_left()

func move_up():
	location.y = location.y-speed
	pos += Vector2(0,-1)
	map.generate_tiles(pos, 0)
	set_position(location)

func move_down():
	location.y = location.y+speed
	pos += Vector2(0,1)
	map.generate_tiles(pos, 2)
	set_position(location)
	
func move_left():
	location.x = location.x-speed
	pos += Vector2(-1,0)
	map.generate_tiles(pos, 3)
	set_position(location)

func move_right():
	location.x = location.x+speed
	pos += Vector2(1,0)
	map.generate_tiles(pos, 1)
	set_position(location)

