extends Control

func pause_game():
	get_tree().paused = true;
	visible = true;

func _on_Home_pressed():
	visible = false 
	get_tree().paused = false
	get_tree().call_group('Interface','restart')


func _on_Next_pressed():
	visible = false
	get_tree().call_group('Interface','pause_countdown')
