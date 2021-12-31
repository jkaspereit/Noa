extends Spatial

onready var ForestGod = get_tree().get_root().find_node("ForestGod",true,false)

export var q = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	if not ObstacleRng.place_obstacle(q):
		queue_free()
	if ForestGod.is_forestgod_section(global_transform.origin.z):
		queue_free()

func _on_Area_body_entered(body):
	get_tree().call_group('Interface','game_over');
