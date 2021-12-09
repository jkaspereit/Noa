extends CanvasLayer

onready var ScoreValue = $DeadScreen/VBoxContainer/HBoxContainer/ScoreValue
onready var CoinValue = $DeadScreen/VBoxContainer/HBoxContainer2/CoinValue

func show_StartingArea():
	$StartingArea.visible = true

func hide_StartingArea():
	$StartingArea.visible  = false

func show_DeadScreen(score, coins):
	ScoreValue.text = str(score)
	CoinValue.text = str(coins)
	$DeadScreen.visible = true

func hide_DeadScreen():
	$DeadScreen.visible = false
