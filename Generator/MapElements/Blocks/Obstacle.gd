extends Spatial

func _on_Area_body_entered():
	Pathfinder.reset()
	get_tree().change_scene("res://GUI/GUI.tscn")
