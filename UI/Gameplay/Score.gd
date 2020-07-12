extends VBoxContainer

export(NodePath) var anim_ref
var anim : AnimationPlayer

export(NodePath) var score_text_ref
var score_text

export(NodePath) var score_num_ref
var score_num

export(NodePath) var high_text_ref
var high_text

export(NodePath) var high_num_ref
var high_num

func _ready():
	score_text = get_node(score_text_ref)
	score_num = get_node(score_num_ref)
	high_text = get_node(high_text_ref)
	high_num = get_node(high_num_ref)
	anim = get_node(anim_ref)
	
func set_score(score : String, fancy: bool = false):
	if int(score) < int(high_num.get_text()):
		if fancy:
			anim.play('fancy score update')
	else:
		if fancy:
			anim.play('fancy high update')
		high_num.set_bbcode('[right]%s' % score)
	
	score_num.set_bbcode('[right]%s' % score)

func set_high(i : String):
	high_num.set_bbcode('[right]%s' % i)

func wave_score(s : String):
	score_num.set_bbcode('[right][wave freq=20 amp=50]%s' % s)
	score_text.set_bbcode('[right][wave freq=20 amp=50]Score')
	
func wave_high(s : String):
	high_num.set_bbcode('[right][wave freq=20 amp=50]%s' % s)
	high_text.set_bbcode('[right][wave freq=20 amp=50]High Score')
	
func normal_score(s:String):
	print('normaling score')
	score_num.set_bbcode('[right]%s' % s)
	score_text.set_bbcode('[right]Score')
	
func normal_high(s:String):
	print('normaling high')
	high_num.set_bbcode('[right]%s' % s)
	high_text.set_bbcode('[right]High Score')
	
