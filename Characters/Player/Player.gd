extends KinematicBody2D

export(NodePath) var tilemap_reference
export(bool) var debug_movement
export(NodePath) var sprite_ref
export(NodePath) var tween_ref

var location = Vector2()
var speed = 128
var pos = Vector2(0,0)
var tween
export(float) var move_speed = 0.5

var map
var sprite
var root
var moving = false

signal player_destroyed
signal done_moving

func _ready():
	root = get_tree().get_current_scene()
	map = get_node(tilemap_reference)
	sprite = get_node(sprite_ref)
	tween = get_node(tween_ref)
	
	if map != null:
		location = map.map_to_world(Vector2(0,0)) + Vector2(64, 64)
		set_global_position(location)
	else:
		location == get_position()
		print("Warning: If player is in actual game, make sure Tilemap Reference is assigned, otherwise grid generation will not function.")
	
	if sprite == null:
		print("Warning: Sprite reference on player not assigned. Will cause unexpected behavior when destroyed in main scene.")
	
	connect("player_destroyed", root, "_on_player_destroyed")

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
	if !moving:
		location.y = location.y-speed
		pos += Vector2(0,-1)
		map.generate_tiles(pos, 0)
		moving = true
		tween.interpolate_property(self, 'position', get_position(), location, move_speed, Tween.TRANS_QUAD)
		tween.start()
		yield(tween, 'tween_completed')
		moving = false
		emit_signal("done_moving")

func move_down():
	if !moving:
		location.y = location.y+speed
		pos += Vector2(0,1)
		map.generate_tiles(pos, 2)
		moving = true
		tween.interpolate_property(self, 'position', get_position(), location, move_speed, Tween.TRANS_QUAD)
		tween.start()
		yield(tween, 'tween_completed')
		moving = false
		emit_signal("done_moving")
	
func move_left():
	if !moving:
		location.x = location.x-speed
		pos += Vector2(-1,0)
		map.generate_tiles(pos, 3)
		moving = true
		tween.interpolate_property(self, 'position', get_position(), location, move_speed, Tween.TRANS_QUAD)
		tween.start()
		yield(tween, 'tween_completed')
		moving = false
		emit_signal("done_moving")

func move_right():
	if !moving:
		location.x = location.x+speed
		pos += Vector2(1,0)
		map.generate_tiles(pos, 1)
		moving = true
		tween.interpolate_property(self, 'position', get_position(), location, move_speed, Tween.TRANS_QUAD)
		tween.start()
		yield(tween, 'tween_completed')
		moving = false
		emit_signal("done_moving")

func _on_hitbox_area_entered(area):
	emit_signal("player_destroyed")
	get_node("SEDeath").play()
	sprite.set_visible(false)
	
func rotate_right_sprite():
	sprite.rotation_degrees = 0
	sprite.rotation_degrees = 90
	
func rotate_down_sprite():
	sprite.rotation_degrees = 0
	sprite.rotation_degrees = 180

func rotate_left_sprite():
	sprite.rotation_degrees = 0
	sprite.rotation_degrees = 270

func rotate_up_sprite():
	sprite.rotation_degrees = 0

