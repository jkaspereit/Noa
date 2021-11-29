extends Node

const Fork1 = preload("res://Generator/MapElements/Forks/Fork1.tscn")

const P_Fork1 = 0.5

const Fork2 = preload("res://Generator/MapElements/Blocks/Cube3x3.tscn")

const P_Fork2 = 1

func _ready():
	randomize()

func create():
	var q = randf()
	if q <= P_Fork1:
		ElementFactory.new_fork(Fork1)
	else:
		ElementFactory.new_fork(Fork2)
