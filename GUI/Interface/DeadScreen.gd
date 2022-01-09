extends Control

func game_over():
	update();
	visible = true;
	
	
func _on_Button_pressed():
	visible = false
	get_tree().call_group('Interface','play_again')

func update():
	$VBoxContainer/HBoxContainer/DistanceValue.text = str(Gamestate.distance)
	$VBoxContainer/HBoxContainer2/CoinValue.text = str(Gamestate.coins)
	$VBoxContainer/HBoxContainer3/GapsValue.text = str(Gamestate.gaps)
	$VBoxContainer/HBoxContainer4/ObstacleValue.text = str(Gamestate.gaps)
