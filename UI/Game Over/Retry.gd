extends Button

func _on_Retry_pressed():
	get_tree().change_scene("res://Levels/main.tscn")


func _on_Main_menu_pressed():
	get_tree().change_scene("res://UI/Title/title.tscn")
