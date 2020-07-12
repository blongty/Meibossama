extends Control

export(NodePath) var highscore_ref
var highscore

func _ready():
	highscore = get_node(highscore_ref)
	
	# Get latest high score
	var file = File.new()
	file.open("res://highscore.txt", File.READ)
	var high_num = file.get_as_text()
	file.close()
	
	# Set high score
	highscore.set_text('High Score: %s' % high_num)

func _on_Quit_pressed():
	 get_tree().quit()


func _on_Start_pressed():
	get_tree().change_scene("res://Levels/main.tscn")

