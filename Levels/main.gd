extends Node2D

export(NodePath) var UI_ref

var _score = 0
var _time = 0
var _ongoing = false
var UI

signal score_changed


func _ready():
	UI = get_node(UI_ref)
	start_game()

func _process(delta):
	if _ongoing:
		_time = _time + delta
		if _score != int(_time):
			_score = int(_time)
			emit_signal("score_changed", get_score())
	
func start_scoring(b:bool):
	_ongoing = b

func get_score():
	return _score

func start_game():
	start_scoring(true)
	UI.button_enable(true)
	connect('score_changed', UI, 'update_ui_score')

func _on_player_destroyed():
	game_over()

func game_over():
	UI.button_enable(false)
	start_scoring(false)
