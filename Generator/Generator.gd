extends Spatial

onready var character = get_tree().get_root().find_node("Character",true,false)
onready var map_elements = get_tree().get_root().find_node("MapElements",true,false)
var score = 0
var coins = 0

func _ready():
	ElementFactory.init()
	ElementCollector.init()
	ObjectFactory.init()

func _process(delta):
	Pathfinder.find_path()
#	ElementCollector.collect_map_elements()
	
	get_tree().call_group("Interface", 'update_interface', str(score), str(coins))
	
	if Pathfinder.path.size() > 0:
		var CharHeight = character.translation.y
		var PathHeight = Pathfinder.path[0].y
		if PathHeight - CharHeight > 5:
			Pathfinder.reset()
			get_tree().change_scene("res://GUI/GUI.tscn")
#			get_tree().paused = true

func coin_collected():
	coins += 1
