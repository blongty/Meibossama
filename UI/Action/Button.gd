extends Button

func _on_Button_pressed():
	set_modulate(Color.red)
	var choice
	
	# Generate a integer between 1 and 4 inclusively
	choice = randi()%4+1
	
	# If 1, print something
	if choice == 1:
		print('1')	
	
	# Else if 2, print something else
	elif choice ==2:
		print('2')
	
	# else if 3, print something else
	elif choice ==3: 
		print("3")
	
	# else if 4, do something eauingjkaeng
	elif choice ==4:
		print('4')
