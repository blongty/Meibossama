extends KinematicBody2D

export(NodePath) var tilemap_reference

var location = Vector2()
var speed = 128

onready var map = get_node(tilemap_reference)

func _ready():
	position = map.map_to_world(Vector2(0,0)) + Vector2(128, 128)
	print('moved to position...')

func _physics_process(delta):
	pass
	if Input.is_action_just_pressed("ui_up"):
		location.y = location.y-speed
	elif Input.is_action_just_pressed("ui_down"):
		location.y = location.y+speed
	elif Input.is_action_just_pressed("ui_right"):
		location.x = location.x+speed
	elif Input.is_action_just_pressed("ui_left"):
		location.x = location.x-speed
#
	set_position(location)

func move_up():
	location.y = location.y-speed
	set_position(location)

func move_down():
	location.y = location.y+speed
	set_position(location)
	
func move_left():
	location.x = location.x-speed
	set_position(location)

func move_right():
	location.x = location.x+speed
	set_position(location)

