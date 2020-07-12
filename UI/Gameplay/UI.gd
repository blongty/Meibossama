extends Control

export(NodePath) var player_reference
export(NodePath) var button_reference
export(NodePath) var score_display

var _score_display
var button

signal action_button_pressed

func _ready():
	button = get_node(button_reference)
	_score_display = get_node(score_display)

func _on_player_destroyed():
	button.enable(false)

func button_enable(b:bool):
	button.enable(b)
	
func update_ui_score(s:String, fancy: bool = false):
	_score_display.set_score(s, fancy)

func set_highscore(s:String):
	_score_display.set_high(s)

func _on_Player_ready():
	button.on_player_ready()

func _on_player_done_moving():
	button._on_player_done_moving()

func _on_legal_action_button_pressed():
	emit_signal("action_button_pressed")
