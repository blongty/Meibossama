extends Control

#export(NodePath) var score_ref
#var score
#
#export(NodePath) var high_score_ref
#var high_score

signal main_menu_request
signal retry_request

func over_menu():
	visible = true

func _on_Retry_button_up():
	visible = false
	emit_signal("retry_request")

func _on_Main_menu_button_up():
	emit_signal("main_menu_request")
