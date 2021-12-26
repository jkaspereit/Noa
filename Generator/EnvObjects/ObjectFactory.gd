extends Node

const ENVObject1 = preload("res://Generator/EnvObjects/StartArea/EnvObject1.tscn")
const ENVObject2 = preload("res://Generator/EnvObjects/StartArea/EnvObject2.tscn")
const ENVObject3 = preload("res://Generator/EnvObjects/StartArea/EnvObject3.tscn")
const ENVObject4 = preload("res://Generator/EnvObjects/StartArea/EnvObject4.tscn")
const ENVObject5 = preload("res://Generator/EnvObjects/StartArea/EnvObject5.tscn")
const ENVObject6 = preload("res://Generator/EnvObjects/StartArea/EnvObject6.tscn")
const ENVObject7 = preload("res://Generator/EnvObjects/StartArea/EnvObject7.tscn")
const ENVObject8 = preload("res://Generator/EnvObjects/StartArea/EnvObject8.tscn")
const ENVObject9 = preload("res://Generator/EnvObjects/StartArea/EnvObject9.tscn")
const ENVObject10 = preload("res://Generator/EnvObjects/StartArea/EnvObject10.tscn")

var x_range = 8
var y_range = 4
var z_range: int = 4

var zpos: int = -2


# Maximum of ambient_objects
const MAX_SIZE = 400
# Map elements node.
var env_objects

# Prepares the factory for production.
func init():
	env_objects = get_tree().get_root().find_node("EnvElements",true,false)
	# empty environment elements
	for child in env_objects.get_children():
		env_objects.remove_child(child)

func calculate_next_position():
	var x = (randi() % x_range) - (x_range/2)
	var y = (randi() % y_range) - (y_range/2)
	zpos = (zpos- z_range)
	return Vector3(x,y,zpos)

# Adds environment objects to the scene
func new_object():
	var object = new_instance()
	object.set_translation(calculate_next_position())
	env_objects.add_child(object)

func new_instance():
	var q = randf()
	if q <= 0.1:
		return ENVObject1.instance()
	elif q <= 0.2:
		return ENVObject2.instance()
	elif q <= 0.3:
		return ENVObject3.instance()
	elif q <= 0.4:
		return ENVObject4.instance()
	elif q <= 0.5:
		return ENVObject5.instance()
	elif q <= 0.6:
		return ENVObject6.instance()
	elif q <= 0.7:
		return ENVObject7.instance()
	elif q <= 0.8:
		return ENVObject8.instance()
	elif q <= 0.9:
		return ENVObject9.instance()
	elif q <= 1:
		return ENVObject10.instance()
