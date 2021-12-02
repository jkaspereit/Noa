extends Node

# Probabilities for map elements.
const P_SINGLE = 0.4
const P_CURVE = 0.7
const P_STAIRS = 0.8
const P_GAP = 0.9
const P_FORK = 1

# Path for the character
var path = []

func _ready():
	randomize()
	path.append(Vector3(0,0,-2.5))

# Process this method to find a path for the character. 
func find_path():
	# Uses a multidimensional random walk to find a path.
	var q = randf()
	if q <= P_SINGLE:
		Blocks.create()
	elif q <= P_CURVE:
		Curves.create()
	elif q <= P_STAIRS:
		Stairs.create()
	elif q <= P_GAP:
		Gaps.create()
	elif q <= P_FORK:
		Forks.create()

# Every new map element has a path that must be added.
func add_path(path_element):
	path.append_array(path_element.get_path())

func reset():
	path = []
	path.append(Vector3(0,0,-2.5))
