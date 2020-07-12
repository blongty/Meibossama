extends VBoxContainer

export(NodePath) var anim_ref
var anim : AnimationPlayer

export(NodePath) var score_num_ref
var score_num

export(NodePath) var high_num_ref
var high_num

func _ready():
	score_num = get_node(score_num_ref)
	high_num = get_node(high_num_ref)
	anim = get_node(anim_ref)
	
func set_score(score : String, fancy: bool = false):
	if int(score) < int(high_num.get_text()):
		if fancy:
			anim.play('fancy score update')
	else:
		if fancy:
			anim.play('fancy high update')
		high_num.set_text(score)
	
	score_num.set_text(score)

func set_high(i : String):
	high_num.set_text(i)
