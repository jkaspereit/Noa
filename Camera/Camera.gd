extends Camera

onready var STARTING_POS = Vector3(1.5,6.4,25)

export var offset = Vector3(0,0,0)
export var smooth_speed: float

onready var Character = get_tree().get_root().find_node("Char",true,false)

func _physics_process(delta):
	if Gamestate.game_running:
		focus_char(delta)


func focus_char(delta):
	var target = offset + Character.translation
	var lerp_value = lerp(get_translation(),target,smooth_speed*delta)
	set_translation(Vector3(lerp_value.x,lerp_value.y,target.z))

func to_settings():
	$AnimationPlayer.play("ToSettings");

func to_home():
	$AnimationPlayer.play("ToHome")

func reset(delta):
	var lerp_value = lerp(get_translation(),STARTING_POS,smooth_speed*delta)
	set_translation(lerp_value)
