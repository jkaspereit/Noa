extends Control

func pause_countdown():
	visible = true
	$AnimationPlayer.play("Countdown")

func _on_AnimationPlayer_animation_finished(anim_name):
	visible = false
	get_tree().paused = false;
	get_tree().call_group('Interface','continue_game')
