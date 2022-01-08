extends Spatial

const LEFT = 'Left'
const RIGHT = 'Right'

onready var MeshDefault = find_node('Mesh',true,false)
onready var MeshLeft = find_node('MeshLeft',true,false)
onready var MeshRight = find_node('MeshRight',true,false)

# returns the the next element position
func get_next_position():
	return $Next.get_global_transform().origin

# returns the path of this element
func get_path():
	var path = []
	for waypoint in $Path.get_children():
		path.append(waypoint.get_global_transform().origin)
	return path

func get_meshes():
	var meshes = []
	if MeshDefault != null:
		meshes.append_array(MeshDefault.get_children())
	if MeshLeft != null:
		meshes.append_array(MeshLeft.get_children())
	if MeshRight != null:
		meshes.append_array(MeshRight.get_children())
	return meshes

func activate_mesh(type):
	if can_switch_mesh():
		MeshDefault.visible = false
		if type == ElementFactory.LEFT:
			MeshLeft.visible = true
		elif type == ElementFactory.RIGHT:
			MeshRight.visible = true

func can_switch_mesh():
	return MeshDefault != null and MeshRight != null and MeshLeft != null


func _on_GapPassed_body_entered(body):
	if body is KinematicBody:
		Gamestate.gap_passed()
