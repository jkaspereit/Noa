extends Control

onready var Cam = get_tree().get_root().find_node("Camera",true,false)

func _on_CharacterSelection_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			get_tree().call_group('Interface', 'to_settings')

func _on_Play_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			get_tree().call_group('Interface','play')

func to_home(from):
	print('hello worldd')
	visible = true

func to_settings():
	visible = false

func play():
	visible = false
