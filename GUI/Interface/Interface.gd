extends CanvasLayer

onready var ScoreValue = $DeadScreen/VBoxContainer/HBoxContainer/ScoreValue
onready var CoinValue = $DeadScreen/VBoxContainer/HBoxContainer2/CoinValue

func show_StartingArea():
	$StartArea.visible = true

func hide_StartingArea():
	$StartArea.visible  = false

func show_DeadScreen(score, coins):
	ScoreValue.text = str(score)
	CoinValue.text = str(coins)
	$DeadScreen.visible = true

func hide_DeadScreen():
	$DeadScreen.visible = false
