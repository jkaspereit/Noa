extends CanvasLayer

onready var ScoreValue = $Control/VBoxContainer/HBoxContainer/ScoreValue
onready var CoinValue = $Control/VBoxContainer/HBoxContainer2/CoinValue

func show_interface(score, coins):
	ScoreValue.text = str(score)
	CoinValue.text = str(coins)
	$Control.visible = true

func hide_interface():
	$Control.visible  = false

func _on_Button_pressed():
	hide_interface()
	Gamestate.restart()
