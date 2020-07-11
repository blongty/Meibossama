extends Control

export(NodePath) var player_reference
export(NodePath) var button_reference

func _on_player_destroyed():
	get_node("Button").enable(false)
