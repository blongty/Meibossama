extends KinematicBody2D

export(NodePath) var particles_ref
export(NodePath) var tilemap_reference
export(bool) var debug_movement
export(NodePath) var sprite_ref
var sprite

export(NodePath) var tween_ref
var tween

export(PackedScene) var particles_scene
var particles : Particles2D


export(PackedScene) var death_scene
export(NodePath) var death_ref
var death

var location = Vector2()
var speed = 128
var pos = Vector2(0,0)


export(float) var move_speed = 0.5

var map

var root
var moving = false
var alive

signal player_destroyed
signal done_moving

func _ready():
	root = get_tree().get_current_scene()
	map = get_node(tilemap_reference)
	sprite = get_node(sprite_ref)
	tween = get_node(tween_ref)
	particles = get_node(particles_ref)
	death = get_node(death_ref)
	
	init()

func init(retry: bool = false):
	print('retry %s' % retry)
	print(particles)
	pos = Vector2(0, 0)
	alive = true
	moving = false
	location = map.map_to_world(Vector2(0,0)) + Vector2(64, 64)
	set_global_position(location)
	if retry:
		sprite.remove_child(particles)
		particles.queue_free()
		remove_child(death)
		death.queue_free()
		
		particles = particles_scene.instance()
		particles.set_position(Vector2(0, 0))
		sprite.add_child(particles)
		
		death = death_scene.instance()
		death.set_position(Vector2.ZERO)
		add_child(death)
		print(particles)

	sprite.set_visible(true)

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
		emit_signal("done_moving", alive)

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
		emit_signal("done_moving", alive)
	
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
		emit_signal("done_moving", alive)

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
		emit_signal("done_moving", alive)

func _on_hitbox_area_entered(area):
	if alive == true:
		emit_signal("player_destroyed")
		get_node("SEDeath").play()
		sprite.set_visible(false)
		death.dead()
		alive = false
	
func rotate_right_sprite():
	sprite.set_rotation_degrees(0)
	sprite.set_rotation_degrees(90)
	
func rotate_down_sprite():
	sprite.set_rotation_degrees(0)
	sprite.set_rotation_degrees(180)

func rotate_left_sprite():
	sprite.set_rotation_degrees(0)
	sprite.set_rotation_degrees(270)

func rotate_up_sprite():
	sprite.set_rotation_degrees(0)

