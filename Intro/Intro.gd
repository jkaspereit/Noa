extends Control

func _ready():
	$AnimatedSprite.playing = true

func _on_Button_pressed():
	visible = false
	get_tree().call_group('Auth','to_login')
