extends Control

export(NodePath) var score_ref
var score

export(NodePath) var high_score_ref
var high_score

signal main_menu_request
signal retry_request

func _ready():
	score = get_node(score_ref)
	high_score = get_node(high_score_ref)

func show_and_update(s:String, h:String):
	score.set_text(s)
	high_score.set_text(h)
	visible = true

func _on_Retry_button_up():
	visible = false
	emit_signal("retry_request")

func _on_Main_menu_button_up():
	emit_signal("main_menu_request")
