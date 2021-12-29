extends Control

onready var Cam = get_tree().get_root().find_node("Camera",true,false)


func _on_CharacterSelection_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			Cam.move_to_menu()
