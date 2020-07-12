extends VBoxContainer

export(NodePath) var score_num_ref
var score_num

export(NodePath) var high_num_ref
var high_num

func _ready():
	score_num = get_node(score_num_ref)
	high_num = get_node(high_num_ref)
	
func set_score(i : String):
	score_num.set_text(i)

func set_high(i : String):
	high_num.set_text(i)
