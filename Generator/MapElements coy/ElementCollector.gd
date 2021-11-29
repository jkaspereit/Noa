extends Node

# Minimal distance to character, before collecting elements.
const MIN_DISTANCE = 25

# Character, MapElements Node
var character
var map_elements

# Prepares the Collector for collecting.
func init():
	map_elements = get_tree().get_root().find_node("MapElements",true,false)
	character = get_tree().get_root().find_node("Character",true,false)

# Frees passed map_elements.
func collect_map_elements():
	if map_elements.get_children().size() > 0:
		var first_element = map_elements.get_child(0)
		var distance = get_distance(character,first_element)
		# Only free elements with MIN_DISTANCE to the character.
		if distance > MIN_DISTANCE:
			first_element.queue_free()

# Calculates the distance between two nodes
func get_distance(node1, node2):
	var n1_z = abs(node1.translation.z)
	var n2_z = abs(node2.translation.z)
	# The distance is the difference between the z-translations.
	return n1_z - n2_z;
