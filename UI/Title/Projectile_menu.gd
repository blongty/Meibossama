extends RigidBody2D

export(NodePath) var anim_sprite_ref
onready var anim_sprite = get_node(anim_sprite_ref)

export(float) var speed = 80
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var frames = anim_sprite.get_sprite_frames()
	var anim_name = frames.get_animation_names()[randi() % frames.get_animation_names().size()]
	
	anim_sprite.play(anim_name)
	
	var angle = rand_range(0, 360)
	var dir = Vector2(cos(angle), sin(angle))

	apply_impulse(Vector2.ZERO, Vector2(dir.x*speed, dir.y*speed))
