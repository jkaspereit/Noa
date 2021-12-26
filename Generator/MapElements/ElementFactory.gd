extends Node

const MAX_HEIGHT = 4
const MIN_HEIGHT = -4

# Necessary Direction
const LEFT = 90
const RIGHT = -90
const FORWARD = 0

# Maximum of map elements.
const MAX_SIZE = 200
# Map elements node.
var map_elements

# Position and direction of the element to be created.
var current_position
var current_direction

# Prepares the factory for production.
func init():
	map_elements = get_tree().get_root().find_node("MapElements",true,false)
	# empty map_elements
	for child in map_elements.get_children():
		map_elements.remove_child(child)
	current_position = get_start_pos()
	current_direction = FORWARD

# Adds a curve element to the scene, if it's possible.
func new_curve(block, curve_direction):
	# Only if there is enough space we can add a new curve.
	if there_is_free_space():
		var element = instantiate(block)
		# If it's a forbidden curve, abort! 
		if IntegrityChecker.is_curve_forbidden(element,curve_direction,current_direction):
			element.queue_free()
			return
		# Else check the boundry condition...
		if IntegrityChecker.is_out_of_bounds(element):
			# and if it's tangled, fix it.
			reposition(element)
		# Add path and do updates. 
		Pathfinder.add_path(element)
		update_current_position(element)
		update_current_direction(curve_direction)

# Adds an fork element to the scene, if it's possible.
func new_fork(fork_tscn):
	# restriction - place forks only forwards
	if current_direction == FORWARD:
		new_element(fork_tscn)

func new_upstairs(stairs_tscn):
	# Stairs shouldn't be out of MAX_HEIGHT
	if current_position.y + 1.5 < MAX_HEIGHT:
		 new_element(stairs_tscn)

func new_downstairs(stairs_tscn):
	# Stairs shouldn't be out of MAX_HEIGHT
	if current_position.y - 1.5 > MIN_HEIGHT:
		 new_element(stairs_tscn)

# Adds an element to the scene, if it's possible.
func new_element(element_tscn):
	# Only if there is enough space we can add new elements.
	if there_is_free_space():
		var element = instantiate(element_tscn)
		# If the out of bounds condition is tangled...
		if IntegrityChecker.is_out_of_bounds(element):
			# No problem, we can fix this. 
			reposition(element)
		# Don't forget to extend the path...  
		Pathfinder.add_path(element)
		# update current position
		update_current_position(element)

# Checks if there is enough space for a new element.
func there_is_free_space():
	return map_elements.get_children().size() < MAX_SIZE

# Create a new instance from the given tscn.
# And adds it to the game.
func instantiate(element_tscn):
	var element = element_tscn.instance()
	# Don't forget to set the correct position...
	element.set_translation(current_position)
	# and rotation.
	var rotation = Vector3(0,current_direction,0)
	element.set_rotation_degrees(rotation)
	# Finally, add the element to the game.
	map_elements.add_child(element)
	return element;

# Repositions the given map_element to fit it into the boundrys. 
func reposition(map_element):
	# Step 1: Translate the map_element 
	if current_direction == LEFT:
		map_element.translation.x -= 0.5
		# Hint: The battlements also need to be fixed
		map_element.activate_mesh(LEFT)
	if current_direction == RIGHT:
		map_element.translation.x += 0.5
		# Hint: The battlements also need to be fixed
		map_element.activate_mesh(RIGHT)
	map_element.translation.z += 0.5
	# Step 2: Rotate the map_element. 
	map_element.rotation_degrees.y -= current_direction
	update_current_direction(-current_direction)

func update_current_position(map_element):
	current_position = map_element.get_next_position()

func update_current_direction(direction):
	current_direction = (current_direction + direction) % 360

func get_start_pos():
	# find the node that contains the start position
	var start_pos_node = get_tree().get_root().find_node("StartPosition",true,false)
	# its translation is the start position for the generation
	return start_pos_node.translation
