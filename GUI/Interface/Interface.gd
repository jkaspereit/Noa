extends CanvasLayer

onready var ScoreValue = $Control/VBoxContainer/HBoxContainer/ScoreValue
onready var CoinValue = $Control/VBoxContainer/HBoxContainer2/CoinValue

func update_interface(score, coins):
	ScoreValue.text = score
	CoinValue.text = coins
