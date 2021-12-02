extends Node

const Fork1 = preload("res://Generator/MapElements/Forks/Fork1.tscn")

const P_Fork1 = 1

func _ready():
	randomize()

func create():
	var q = randf()
	if q <= P_Fork1:
		ElementFactory.new_fork(Fork1)
