extends Label

var time = 0


func _process(delta):
	# delta is the amount of time that has passed between this frame and the next frame
	# using that, try to create a stopwatch
	time = time + delta
	set_text(str(int(time)))
	
	pass
