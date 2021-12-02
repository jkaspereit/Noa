extends Spatial

func _ready():
	ElementFactory.init()
	ElementCollector.init()
	ObjectFactory.init()

func _process(delta):
	Pathfinder.find_path()
	ObjectFactory.new_object()
#	ElementCollector.collect_map_elements()
