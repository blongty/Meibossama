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
	
func init():
	button.reroll(true)

func _on_player_destroyed():
	button.enable(false)
	score_display.wave_score()

func button_enable(b:bool):
	button.enable(b)
	
func update_ui_score(s:String, fancy: bool = false):
	_score_display.set_score(s, fancy)

func set_highscore(s:String):
	_score_display.set_high(s)

func _on_Player_ready():
	button.on_player_ready()

func _on_player_done_moving(alive : bool):
	button._on_player_done_moving(alive)

func _on_legal_action_button_pressed():
	emit_signal("action_button_pressed")
	
func wave_high(s):
	_score_display.wave_high(str(s))
	
func wave_score(s):
	_score_display.wave_score(str(s))
	
func normal_score(s):
	_score_display.normal_score(str(s))

func normal_high(s):
	_score_display.normal_high(str(s))
