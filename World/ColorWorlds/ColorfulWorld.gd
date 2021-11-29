extends Node

const MAIN = 'Main'
const RING = 'Rings'
const BRICKS = 'Bricks'
const TILES = 'Tiles'
const LEAVES = 'Leaves'
const TRUNK = 'Trunk'
const PLATTFORM = 'Plattform'

onready var StartingArea = get_tree().get_root().find_node('StartingArea',true,false)

onready var map_elements = get_tree().get_root().find_node('MapElements', true, false)
onready var env_elements = get_tree().get_root().find_node('EnvElements', true, false)


func ink_background():
	pass
	
func ink_element(map_element):
	var meshes = map_element.get_meshes()
	if meshes == null:
		return
	for mesh in meshes:
		match mesh.name:
			MAIN: set_material(mesh,StartingArea.Main)
			RING: set_material(mesh,StartingArea.Ring)
			BRICKS: set_material(mesh,StartingArea.Bricks)
			TILES: set_material(mesh,StartingArea.Tiles)
			LEAVES: set_material(mesh,StartingArea.Leaves)
			TRUNK: set_material(mesh,StartingArea.Trunk)
			PLATTFORM: set_material(mesh,StartingArea.Plattform)

func set_material(node,material):
	for child in node.get_children():
		# if its a mesh, overide its material
		if child is MeshInstance:
			child.set_material_override(material)
		# Process Subfolders 
		else:
			set_material(child, material)
