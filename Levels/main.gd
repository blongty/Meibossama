extends Node2D

export(NodePath) var UI_ref
var UI

export(NodePath) var game_over_screeen_ref
var game_over_screen

export(NodePath) var aud_high_ref
var aud_high

export(NodePath) var spawner_ref
var spawner

export(NodePath) var fader_ref
onready var fader = get_node(fader_ref)

export(NodePath) var player_ref
onready var player = get_node(player_ref)

export(int) var action_score_bonus = 2
export(int) var iterative_action_bonus = 1

onready var _action_score_bonus = action_score_bonus

var _prev_score = 0
var _action_score = 0
var _highscore = 0
var _time = 0
var _ongoing = false

var beat_high = false

signal score_changed


func _ready():
	fader.set_dark()
	UI = get_node(UI_ref)
	game_over_screen = get_node(game_over_screeen_ref)
	aud_high = get_node(aud_high_ref)
	spawner = get_node(spawner_ref)
	
	# Reading for existing high score
	var highscore_file = File.new()
	highscore_file.open("res://highscore.txt", File.READ)
	_highscore = int(highscore_file.get_as_text())
	highscore_file.close()
	
	UI.set_highscore(str(_highscore))
	
	fader.fade_in()
	yield(fader, 'anim_done')
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
	spawner.start()
	
func restart_game():
	beat_high = false
	player.init(true)
	spawner.butcher()
	UI.init()
	_time = 0
	_prev_score = 0
	_action_score = 0
	_action_score_bonus = action_score_bonus
	emit_signal("score_changed", str(get_score()))
	start_game()

func _on_player_destroyed():
	game_over()

func game_over():
	# Checking
	spawner.stop()
	start_scoring(false)
	if get_score() > _highscore:
		_highscore = get_score()
		var highscore_file = File.new()
		highscore_file.open("res://highscore.txt", File.WRITE)
		highscore_file.store_string(str(get_score()))
		highscore_file.close()
		UI.set_highscore(str(get_score()))
		
#		game_over_screen.show_and_update(str(get_score()), str(get_score()))
#	else:
#		game_over_screen.show_and_update(str(get_score()), str(_highscore))
	
	# End user control
	game_over_screen.over_menu()
	UI.button_enable(false)
	
func _on_UI_action_button_pressed():
	_action_score += _action_score_bonus
	_action_score_bonus += iterative_action_bonus
	emit_signal("score_changed", str(get_score()), true)


func _on_main_menu_request():
	fader.fade_out()
	yield(fader, "anim_done")
	get_tree().change_scene("res://UI/Title/title.tscn")
