extends MeshInstance

onready var Character = get_tree().get_root().find_node("Char",true,false)

export var section_range = 150
export var visible_range = 50

var processing_enabled = false

func _process(delta):
	if not processing_enabled:
		return
	var section_pos = int(Character.translation.z) % section_range
	if is_forestgod_section(section_pos):
		visible = true
	else:
		visible = false

func is_forestgod_section(z_pos: float):
	return abs(int(z_pos) % section_range) > section_range - visible_range

func play():
	processing_enabled = true;

func game_over():
	processing_enabled = false
