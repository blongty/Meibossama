extends Control

export(NodePath) var highscore_ref
var highscore

export(NodePath) var trans_ref
var trans

export(NodePath) var help_ref
var help

func _ready():
	highscore = get_node(highscore_ref)
	trans = get_node(trans_ref)
	help = get_node(help_ref)
	
	# Get latest high score
	var file = File.new()
	file.open("res://highscore.txt", File.READ)
	var high_num = file.get_as_text()
	file.close()
	
	# Set high score
	highscore.set_text('High Score: %s' % high_num)
	
	trans.fade_in()

func _on_Quit_pressed():
	 get_tree().quit()

func _on_Start_pressed():
	trans.fade_out()
	yield(trans, 'anim_done')
	get_tree().change_scene("res://Levels/main.tscn")



func _on_Help_pressed():
	help.visible = true


func _on_Return_pressed():
	help.visible = false
