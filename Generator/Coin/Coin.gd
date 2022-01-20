extends Spatial

func _on_Area_body_entered(body):
	get_tree().call_group('Interface','coin_collected')
	$AudioStreamPlayer3D.play()
	$AnimationPlayer.play("collected")

