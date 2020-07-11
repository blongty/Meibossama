extends Button

var player
var ui_root

func _ready():
	ui_root = get_parent()
	player = ui_root.get_node(ui_root.player_reference)

func _on_Button_pressed():
	var choice
	
	# Generate a integer between 1 and 4 inclusively
	choice = randi()%4+1
	
	# If 1, print something
	if choice == 1:
		player.move_up()
		print('moved up')
	
	# Else if 2, print something else
	elif choice == 2:
		player.move_down()
		print('moved down')
	
	# else if 3, print something else
	elif choice == 3: 
		player.move_right()
		print('moved right')
	
	# else if 4, do something eauingjkaeng
	elif choice == 4:
		player.move_left()
		print('moved left')
