extends Camera

onready var STARTING_POS = Vector3(1.5,6.4,25)

export var offset = Vector3(0,0,0)
export var smooth_speed: float

onready var Character = get_tree().get_root().find_node("Char",true,false)

var processing_enabled = false;

func _physics_process(delta):
	if processing_enabled:
		focus_char(delta)

func focus_char(delta):
	var target = offset + Character.translation
	var lerp_value = lerp(get_translation(),target,smooth_speed*delta)
	set_translation(Vector3(lerp_value.x,lerp_value.y,target.z))

func play():
	processing_enabled = true;

func game_over():
	processing_enabled = false;

func to_shop():
	$AnimationPlayer.play("ToSettings");

func to_leaderboard():
	$AnimationPlayer.play("ToSettings");

func to_selection():
	$AnimationPlayer.play("ToSettings");

func to_settings():
	$AnimationPlayer.play("ToSettings");

func to_home():
	$AnimationPlayer.play("ToHome")

func play_again():
	$Tween.interpolate_property(self,"translation",
		translation, STARTING_POS,2,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$Tween.start()

func _on_Tween_tween_completed(object, key):
	get_tree().call_group('Interface','at_home');
