extends "res://Characters/CharacterMotion.gd"


func _ready():
	TEXTURE_FORWARD = load("res://Characters/Noa/WalkForward.tres")
	TEXTURE_FORWARD_JUMP = load("res://Characters/Noa/WalkForwardJump.tres")
	TEXTURE_LEFT = load("res://Characters/Noa/WalkLeft.tres")
	TEXTURE_LEFT_JUMP = load("res://Characters/Noa/WalkLeftJump.tres")
	TEXTURE_RIGHT = load("res://Characters/Noa/WalkRight.tres")
	TEXTURE_RIGHT_JUMP = load("res://Characters/Noa/WalkRightJump.tres")
	TEXTURE_HOME = load("res://Characters/Noa/Home.tres")
	DEATH = load("res://Characters/Noa/Death.tres")
