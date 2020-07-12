extends Button

var player
export(NodePath) var main_ref
var main
var choice
export(NodePath) var button_se_ref
var button_se

export(Array, Texture) var arrow_icons

enum {UP, RIGHT, DOWN, LEFT}

signal legal_action_button_pressed

func _ready():
	grab_focus()
	main = get_node(main_ref)
	player = main.get_node(main.player_reference)
	button_se = get_node(button_se_ref)
	
	choice = randi()%4
	set_button_icon(arrow_icons[choice])
	
func _on_Button_pressed():
	if disabled:
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

	button_se.play()
	emit_signal('legal_action_button_pressed')
	
	disabled = true

func enable(b: bool):
	disabled = !b
	
func on_player_ready():
	if choice == 1:
		player.rotate_right_sprite()
	elif choice == 0:
		player.rotate_up_sprite()
	elif choice == 2:
		player.rotate_down_sprite()
	elif choice == 3:
		player.rotate_left_sprite()

func _on_player_done_moving(alive: bool):
	if alive:
		choice = randi()%4
		set_button_icon(arrow_icons[choice])
		on_player_ready()
	
		disabled = false
