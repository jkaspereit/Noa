extends Node

const DownstairsH_V1 = preload("res://Generator/MapElements/Stairs/DownstairsH-V1.tscn")
const UpstairsH_V1 = preload("res://Generator/MapElements/Stairs/UpstairsH-V1.tscn")

const P_DownstairsH_V1 = 0.5
const P_UpstairsH_V1 = 1

func _ready():
	randomize()

func create():
	var q = randf()
	if q <= P_DownstairsH_V1:
		ElementFactory.new_element(DownstairsH_V1)
	elif q <= P_UpstairsH_V1:
		ElementFactory.new_element(UpstairsH_V1)
