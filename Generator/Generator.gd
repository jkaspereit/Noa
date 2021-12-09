extends Spatial

func _ready():
	Pathfinder.init()
	ElementFactory.init()
	ElementCollector.init()
	ObjectFactory.init()

func _process(delta):
	if is_test_mode():
		Pathfinder.find_test_path()
	else: 
		Pathfinder.find_path()
	ObjectFactory.new_object()
#	ElementCollector.collect_map_elements()


func is_test_mode():
	var test_node_exist = get_tree().get_root().find_node('NoaEndless',true,false)
	if test_node_exist == null:
		return false
	return true
