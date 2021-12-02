extends Spatial

func _on_Area_body_entered(body):
	Gamestate.coin_collected()
	queue_free()
