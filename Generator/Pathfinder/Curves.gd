extends Node

const LEFT = 90
const RIGHT = -90

# Left Curves
const LeftCurve3x3H = preload("res://Generator/MapElements/Curves/LeftCurve3x3H.tscn")
const P_LeftCurve3x3H = 1
# Right Curves
const RightCurve3x3H = preload("res://Generator/MapElements/Curves/RightCurve3x3H.tscn")
const P_RightCurve3x3H = 1

func create():
	var q = randf()
	if q <= 0.5: 
		create_left_curve()
	else:
		create_right_curve()
	
func create_left_curve():
	var q = randf()
	if q <= P_LeftCurve3x3H:
		ElementFactory.new_curve(LeftCurve3x3H,LEFT)

func create_right_curve():
	var q = randf()
	if q <= P_RightCurve3x3H:
		ElementFactory.new_curve(RightCurve3x3H,RIGHT)
