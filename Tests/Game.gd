extends Spatial

var score = 0
var coins = 0

func _ready():
	ElementFactory.init()
	ElementCollector.init()
	ObjectFactory.init()

func _process(delta):
	Pathfinder.find_path()
	ElementCollector.collect_map_elements()
	
	ObjectFactory.new_object()
	
	get_tree().call_group("Interface", 'update_interface', str(score), str(coins))
	
	if Pathfinder.path.size() > 0:
		var CharHeight = $Character.translation.y
		var PathHeight = Pathfinder.path[0].y
		if PathHeight - CharHeight > 5:
			Pathfinder.reset()
			get_tree().change_scene("res://GUI/GUI.tscn")

func coin_collected():
	coins += 1
