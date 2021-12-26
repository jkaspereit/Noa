extends Spatial

func _on_Area_body_entered(body):
	if body.collision_layer == 1:
		queue_free()
