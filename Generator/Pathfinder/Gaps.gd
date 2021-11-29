extends Node

const Gap1 = preload("res://Generator/MapElements/Gaps/SingleGap1.tscn")

const P_Gap1 = 1

func _ready():
	randomize()

func create():
	var q = randf()
	if q <= P_Gap1:
		ElementFactory.new_element(Gap1)
