extends Node

const MAX_RANGE = 3
const MIN_RANGE = -3

const LEFT = 90
const RIGHT = -90
const FORWARD = 0

func is_out_of_bounds(map_element):
	var next_position = map_element.get_next_position().x
	if next_position < MIN_RANGE or next_position > MAX_RANGE:
		return true
	return false

func is_curve_forbidden(curve, curve_direction, current_direction):
	if is_out_of_bounds(curve) and current_direction == FORWARD:
		return true
	if curve_direction == LEFT and current_direction == LEFT:
		return true
	if curve_direction == RIGHT and current_direction == RIGHT:
		return true
	return false
