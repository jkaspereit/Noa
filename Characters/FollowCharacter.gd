extends Spatial

export var offset = Vector3(0,0,0)

onready var Character = get_tree().get_root().find_node("Character",true,false)

func _process(delta):
	var temp = offset + Character.translation
	set_translation(Vector3(offset.x,temp.y,temp.z))
