extends MeshInstance

onready var Character = get_tree().get_root().find_node("Char",true,false)

export var section_range = 100
export var visible_range = 25

func _process(delta):
	var section_pos = int(Character.translation.z) % section_range
	if abs(section_pos) > section_range - visible_range:
		visible = true
	else:
		visible = false
	
