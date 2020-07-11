extends Control

export(NodePath) var player_reference
export(NodePath) var button_reference

var button

func _ready():
	button = get_node(button_reference)

func _on_player_destroyed():
	button.enable(false)

func button_enable(b:bool):
	button.enable(b)
	
func update_ui_score(s:int):
	get_node("MarginContainer/Label").set_text(str(s))
