extends Spatial

const FORWARD = 'FORWARD'
const LEFT = 'LEFT'
const RIGHT = 'RIGHT'

onready var PathLeft = translate_path(get_parent().find_node('PathLeft',true,false).get_children())
onready var PathRight = translate_path(get_parent().find_node('PathRight',true,false).get_children())
onready var PathForward = translate_path(get_parent().find_node('Path',true,false).get_children())

export var direction = FORWARD

# positions points before the actual position to change
export var index_offset = 0

var is_path_changeable = false

# changes the path, by replacing a position at a given index,
# with a new path
func change_path(new_path):
	# don't forget to add the parents translation to the path elements
	var offset = get_parent().get_global_transform().origin
	# replace the first path element
	Pathfinder.path[0] = new_path[0] + offset
	# insert the other waypoints
	for j in range(1,new_path.size()):
		Pathfinder.path.insert(j,new_path[j] + offset)

func swipe_ES():
	if not is_path_changeable:
		return
	if direction == FORWARD or direction == RIGHT:
		change_path(PathRight)
	is_path_changeable == false;

func swipe_SW():
	if not is_path_changeable:
		return
	if direction == RIGHT:
		change_path(PathRight)
	if direction == LEFT:
		change_path(PathLeft)
	is_path_changeable == false;

func swipe_WN():
	if not is_path_changeable:
		return
	if direction == FORWARD:
		change_path(PathLeft)
	is_path_changeable == false;

func swipe_NE():
	if not is_path_changeable:
		return
	if direction == RIGHT:
		change_path(PathLeft)
	is_path_changeable == false;

# The path is stored as Position3D,
# but we need the translation of the Position3D Nodes
func translate_path(path):
	var result = []
	for waypoint in path:
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
