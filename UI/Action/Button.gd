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

	# If 1, print something
	if choice == UP:
		player.move_up()
		#player.rotation_degrees()
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
	
	enabled = false

func enable(b: bool):
	enabled = b
	
func on_player_ready():
	if choice == 1:
		player.rotate_right_sprite()
	elif choice == 0:
		player.rotate_up_sprite()
	elif choice == 2:
		player.rotate_down_sprite()
	elif choice == 3:
		player.rotate_left_sprite()


func _on_Button_button_up():
	pass
	
func _on_player_done_moving():
	choice = randi()%4
	set_button_icon(arrow_icons[choice])
	on_player_ready()

	enabled = true
