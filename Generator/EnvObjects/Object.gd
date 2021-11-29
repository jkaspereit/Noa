extends Spatial

onready var Trees = find_node('Trees',true,false)
onready var Plattform = find_node('Plattform',true,false)

func _on_Area_area_entered():
	print('collision detected')
	queue_free()

func get_meshes():
	var meshes = []
	for tree in Trees.get_children():
		# has two mesh child: Leaves, Trunk
		meshes.append_array(tree.get_children())
	# the Plattform just has her meshes. 
	meshes.append(Plattform)
	return meshes
