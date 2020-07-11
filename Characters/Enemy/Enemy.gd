extends Sprite



func _on_outside_spawn_limit(area):
	queue_free()


func _on_hitbox_area_entered(area):
	queue_free()
