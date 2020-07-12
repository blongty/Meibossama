extends Panel

export(NodePath) var animplayer_ref
var animplayer : AnimationPlayer

export(float) var fade_speed = 1

signal anim_done

func _ready():
	animplayer = get_node(animplayer_ref)

func fade_in():
	animplayer.play('fade', -1, fade_speed)
	yield(animplayer, 'animation_finished')
	emit_signal("anim_done")

func fade_out():
	animplayer.play('fade', -1, -fade_speed, true)
	yield(animplayer, 'animation_finished')
	emit_signal("anim_done")

func set_dark():
	set_self_modulate(Color.white)
