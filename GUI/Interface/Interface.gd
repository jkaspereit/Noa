extends CanvasLayer

onready var ScoreValue = $DeadScreen/VBoxContainer/HBoxContainer/ScoreValue
onready var CoinValue = $DeadScreen/VBoxContainer/HBoxContainer2/CoinValue

onready var PlayIntegration = get_node("/root/PlayIntegration")

func _ready():
	PlayIntegration.sign_in();

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
