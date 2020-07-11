extends Button

export(NodePath) var player_reference
var player

func _ready():
	player = get_node(player_reference)

func _on_Button_pressed():
	set_modulate(Color.red)
	var choice
	
	# Generate a integer between 1 and 4 inclusively
	choice = randi()%4+1
	
	# If 1, print something
	if choice == 1:
		player.move_up()
	
	# Else if 2, print something else
	elif choice ==2:
		player.move_down()
	# else if 3, print something else
	elif choice ==3: 
		player.move_right()
	
	# else if 4, do something eauingjkaeng
	elif choice ==4:
		player.move_left()
