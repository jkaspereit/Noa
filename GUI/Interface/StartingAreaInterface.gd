extends Control

# On Button up, else Noa would jump. 
func _on_Button_button_up():
	Gamestate.start_game()
	visible = false
