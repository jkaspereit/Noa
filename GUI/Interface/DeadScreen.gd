extends Control

onready var Interface = get_parent()

func _on_Button_pressed():
	Interface.show_StartingArea()
	Interface.hide_DeadScreen()
	Gamestate.restart()
