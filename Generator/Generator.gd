extends Node

var OBJECTIVES = 200
var PATH_ELEMENTS = 1200

func generate():
	Pathfinder.init()
	ElementFactory.init()
	ObjectFactory.init()
	for i in OBJECTIVES:
		ObjectFactory.new_object()
	for i in PATH_ELEMENTS:
		Pathfinder.find_path()



