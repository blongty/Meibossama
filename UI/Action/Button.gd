extends Button

var player
export(NodePath) var main_ref
var enabled = false
var main
var choice
export(Array, Texture) var arrow_icons

enum {UP, RIGHT, DOWN, LEFT}

func _ready():
	grab_focus()
	enabled = false
	main = get_node(main_ref)
	player = main.get_node(main.player_reference)
	
	choice = randi()%4
	set_button_icon(arrow_icons[choice])

func _on_Button_pressed():
	if !enabled:
		return
		
	
	
	# Generate a integer between 1 and 4 inclusively
	
	# If 1, print something
	if choice == UP:
		player.move_up()
		print('moved up')
	
	# Else if 2, print something else
	elif choice == DOWN:
		player.move_down()
		print('moved down')
	
	# else if 3, print something else
	elif choice == RIGHT: 
		player.move_right()
		print('moved right')
	
	# else if 4, do something eauingjkaeng
	elif choice == LEFT:
		player.move_left()
		print('moved left')
		
	choice = randi()%4
	set_button_icon(arrow_icons[choice])
	
		
func enable(b: bool):
	enabled = b
