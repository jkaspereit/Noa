extends Spatial



func _on_Area_body_entered():
	get_tree().call_group('Gamestate','coin_collected')
	queue_free()
