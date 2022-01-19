extends Control

func play():
	visible = true

func game_over():
	visible = false

func restart():
	visible = false

func coin_collected():
	update()

func raise_distance():
	update()

func update():
	$CoinValue.text = str(Gamestate.coins)
	$DistanceValue.text = str(Gamestate.distance) + ' m'

func _on_PauseButton_pressed():
	visible = false
	get_tree().call_group('Interface','pause_game')

func continue_game():
	visible = true
