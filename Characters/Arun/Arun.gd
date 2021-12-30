extends "res://Characters/CharacterMotion.gd"

func _ready():
	print('hello world')
	TEXTURE_FORWARD = load("res://Characters/Arun/WalkForward.tres")
	TEXTURE_LEFT = load("res://Characters/Arun/WalkForward.tres")
	TEXTURE_RIGHT = load("res://Characters/Arun/WalkForward.tres")
