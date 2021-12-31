extends Spatial

onready var ForestGod = get_tree().get_root().find_node("ForestGod",true,false)

# Called when the node enters the scene tree for the first time.
func _ready():
	if not ForestGod.is_forestgod_section(global_transform.origin.z):
		queue_free()

func _on_Area_body_entered(body):
	if body is KinematicBody:
		get_tree().call_group('Interface', 'game_over')
