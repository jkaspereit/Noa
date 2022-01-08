extends Node

# Probabilities for map elements.
const P_SINGLE = 0.4
const P_CURVE = 0.7
const P_STAIRS = 0.9
const P_GAP = 1
const P_FORK = 0

# Path for the character
var path

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

# Process this method to find a path for the character. 
func find_test_path():
	var p_SINGLE = 0.4
	var p_CURVE = 0.7
	var p_STAIRS = 0
	var p_GAP = 0
	var p_FORK = 0
	# Uses a multidimensional random walk to find a path.
	var q = randf()
	if q <= p_SINGLE:
		Blocks.create()
	elif q <= p_CURVE:
		Curves.create()
	elif q <= p_STAIRS:
		Stairs.create()
	elif q <= p_GAP:
		Gaps.create()
	elif q <= p_FORK:
		Forks.create()


func init():
	randomize()
	# empty path
	path = []
	# find the node that contains the starting path
	var start_path = get_tree().get_root().find_node("StartPath",true,false)
	# add the waypoints of the start path
	for waypoint in start_path.get_children():
		path.append(waypoint.translation)
	print(path)
