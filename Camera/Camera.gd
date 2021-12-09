extends Camera

export var offset = Vector3(0,0,0)
export var smooth_speed: float

onready var Character = get_tree().get_root().find_node("Character",true,false)

# we don't won't to start with rain
var its_raining = true

func _physics_process(delta):
	if Gamestate.game_running:
		var target = offset + Character.translation
		var lerp_value = lerp(get_translation(),target,smooth_speed*delta)
		set_translation(Vector3(lerp_value.x,lerp_value.y,target.z))

func focus_char():
	$AnimationPlayer.play("FocusChar")
