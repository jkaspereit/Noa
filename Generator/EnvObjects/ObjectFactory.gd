extends Node

const FOREST_TSCN = preload("res://Generator/EnvObjects/Forest/Forest1.tscn")

var x_min = 0
var x_range = 4
var y_min = 4
var y_range = 8

var last_plattform_zpos
var z_range = 10


# Maximum of ambient_objects
const MAX_SIZE = 400
# Map elements node.
var env_elements

# Prepares the factory for production.
func init():
	last_plattform_zpos = 0
	env_elements = get_tree().get_root().find_node("EnvElements",true,false)



func calculate_next_position():
	var x = x_min - randi() % x_range
	var y = y_min - randi() % y_range
	var z = last_plattform_zpos - (randi() % z_range)
	return Vector3(x,y,z)


# Adds an element to the scene
func new_object():
	# Only if there is enough space we can add new elements.
	if there_is_free_space():
		# create an element
		var element = FOREST_TSCN.instance()
		# position the element
		var next_position = calculate_next_position()
		element.set_translation(next_position)
		# add it to scene tree
		env_elements.add_child(element)
		# update z position
		last_plattform_zpos = next_position.z - 4
		# We demand a colorful world.
		ColorfulWorld.ink_element(element)

# Checks if there is enough space for a new element.
func there_is_free_space():
	return env_elements.get_children().size() < MAX_SIZE
