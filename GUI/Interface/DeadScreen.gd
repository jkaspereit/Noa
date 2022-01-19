extends Control

func game_over():
	update();
	visible = true;
	
func update():
	$DistanceValue.text = str(Gamestate.distance)
	$CoinValue.text = str(Gamestate.coins)
	$GapsValue.text = str(Gamestate.gaps)
	$ObstacleValue.text = str(Gamestate.gaps)
	$XPValue.text = str(Gamestate.calculate_score())

func _on_PlayAgainButton_pressed():
	visible = false
	get_tree().call_group('Interface','play_again')
