extends AudioStreamPlayer

export(NodePath) var button_ref
var button

func _ready():
	button = get_node(button_ref)

func _on_Button_pressed():
	if button.enabled:
		play()
