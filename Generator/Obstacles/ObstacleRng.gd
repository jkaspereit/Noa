extends Node

var placed_already = false

func place_obstacle(q):
	var p = randf()
	if p <= q or placed_already:
		placed_already = false
		return false
	placed_already = true
	return true
