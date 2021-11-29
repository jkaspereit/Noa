extends Spatial

const FORWARD = 'FORWARD'
const LEFT = 'LEFT'
const RIGHT = 'RIGHT'
const MIDDLE = 'MIDDLE'

onready var PathLeft = get_parent().find_node('PathLeft',true,false).get_children()
onready var PathRight = get_parent().find_node('PathRight',true,false).get_children()
onready var PathForward = get_parent().find_node('Path',true,false).get_children()

onready var Character = get_tree().get_root().find_node('Character', true, false)

export var direction = FORWARD

# positions points before the actual position to change
export var index_offset = 0

var is_path_changeable = false
var line = MIDDLE

# changes the path, by replacing a position at a given index,
# with a new path
func change_path(new_path_node):
	var new_path = translate_path(new_path_node) 
	if new_path.size() < 1:
		return
	# don't forget to add the parents translation to the path elements
	var offset = get_parent().get_global_transform().origin

	# insert the other waypoints
	for j in range(0,new_path.size()):
		Pathfinder.path[j] = new_path[j] + offset
#		Pathfinder.path.insert(j,new_path[j] + offset)

func swipe_ES():
	if not is_path_changeable:
		return
	if direction == FORWARD or direction == RIGHT:
		change_right()

func swipe_SW():
	if not is_path_changeable:
		return
	if direction == RIGHT:
		change_right()
	elif direction == LEFT:
		change_left()

func swipe_WN():
	if not is_path_changeable:
		return
	if direction == FORWARD:
		change_left()

func swipe_NE():
	if not is_path_changeable:
		return
	if direction == RIGHT:
		change_left()

func change_left():
	if line == MIDDLE:
		change_path(PathLeft)
		line = LEFT
	elif line == RIGHT:
		change_path(PathForward)
		line = MIDDLE

func change_right():
	if line == MIDDLE:
		change_path(PathRight)
		line = RIGHT
	elif line == LEFT:
		change_path(PathForward)
		line = MIDDLE

# The path is stored as Position3D,
# but we need the translation of the Position3D Nodes
func translate_path(path):
	var result = []
	for waypoint in path:
		var offset = get_parent().get_global_transform().origin
		if Character.translation.z > waypoint.translation.z + offset.z:
			result.append(waypoint.translation)
	return result

func _on_Area_body_entered(body):
	# When the player enters the are, 
	# he can swipe to change the path
	if body is KinematicBody:
		is_path_changeable = true

func _on_Area_body_exited(body):
	# When the player leaves the area, 
	# he can't change the path any longer
	if body is KinematicBody:
		is_path_changeable = false
