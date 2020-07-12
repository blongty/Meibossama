extends Node2D

export(NodePath) var UI_ref
export(int) var action_score_bonus = 2
export(NodePath) var game_over_screeen_ref
var game_over_screen

export(NodePath) var aud_high_ref
var aud_high

var _prev_score = 0
var _action_score = 0
var _highscore = 0
var _time = 0
var _ongoing = false
var UI
var beat_high = false

signal score_changed


func _ready():
	UI = get_node(UI_ref)
	game_over_screen = get_node(game_over_screeen_ref)
	aud_high = get_node(aud_high_ref)
	
	# Reading for existing high score
	var highscore_file = File.new()
	highscore_file.open("res://highscore.txt", File.READ)
	_highscore = int(highscore_file.get_as_text())
	highscore_file.close()
	
	UI.set_highscore(str(_highscore))
	
	start_game()

func _process(delta):
	if _ongoing:
		_time = _time + delta
		if get_score() != _prev_score:
			emit_signal("score_changed", str(get_score()))
			_prev_score == get_score()
		
		if !beat_high and get_score() > _highscore:
			beat_high = true
			aud_high.play()
	
func start_scoring(b:bool):
	_ongoing = b

func get_score():
	return _action_score + int(_time)

func start_game():
	start_scoring(true)
	UI.button_enable(true)
	connect('score_changed', UI, 'update_ui_score')

func _on_player_destroyed():
	game_over()

func game_over():
	# Checking
	start_scoring(false)
	if get_score() > _highscore:
		var highscore_file = File.new()
		highscore_file.open("res://highscore.txt", File.WRITE)
		highscore_file.store_string(str(get_score()))
		highscore_file.close()
		UI.set_highscore(str(get_score()))
		game_over_screen.show_and_update(str(get_score()), str(get_score()))
	else:
		game_over_screen.show_and_update(str(get_score()), str(_highscore))
	
	# End user control
	UI.button_enable(false)
	
func _on_UI_action_button_pressed():
	_action_score += action_score_bonus
	emit_signal("score_changed", str(get_score()), true)
