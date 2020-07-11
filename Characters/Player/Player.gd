extends KinematicBody2D

var location = Vector2()
var speed = 128

func _physics_process(delta):
	pass
#	if Input.is_action_just_pressed("ui_up"):
#		location.y = location.y-speed
#	elif Input.is_action_just_pressed("ui_down"):
#		location.y = location.y+speed
#	elif Input.is_action_just_pressed("ui_right"):
#		location.x = location.x+speed
#	elif Input.is_action_just_pressed("ui_left"):
#		location.x = location.x-speed
##
#	set_position(location)

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

