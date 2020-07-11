extends KinematicBody2D
var speed = 200
var direction = Vector2(0,0)

export(Array, Texture) var enemy_sprites

# This should have been a RigidBody2D, but for the sake of quickness,
# we have mistakenly writen as a Kinematic, could cause performance
# issues later on.

func _ready():
	get_node("Sprite").set_texture(enemy_sprites[randi()%enemy_sprites.size()])
	
func _physics_process(delta):
	move_and_slide(direction * speed)

func move_up():
	direction.y = -1
	
func move_down():
	direction.y = 1

func move_op_right():
	direction.x = 1

func move_left():
	direction.x = -1

func _on_outside_spawn_limit(area):
	queue_free()

func _on_hitbox_area_entered(area):
	queue_free()
