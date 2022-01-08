extends Control

func game_over():
	update();
	visible = true;
	
	
func _on_Button_pressed():
	visible = false
	get_tree().call_group('Interface','to_home')

func update():
	$VBoxContainer/HBoxContainer/DistanceValue.text = str(Gamestate.score)
	$VBoxContainer/HBoxContainer2/CoinValue.text = str(Gamestate.coins)
	$VBoxContainer/HBoxContainer3/GapsValue.text = str(Gamestate.gaps)
	$VBoxContainer/HBoxContainer4/ObstacleValue.text = str(Gamestate.gaps)
