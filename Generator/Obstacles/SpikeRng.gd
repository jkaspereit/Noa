extends Node

var placed_already = false

func _ready():
	randomize()

func place_obstacle(q):
	var p = randf()
	# do not place a spike
	if p >= q or placed_already:
		placed_already = false
		return false
	# else place a spike
	placed_already = true
	return true
