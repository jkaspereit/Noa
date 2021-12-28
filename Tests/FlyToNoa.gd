extends AnimationPlayer

onready var Character = get_tree().get_root().find_node("Char",true,false)
onready var Sphere = get_tree().get_root().find_node("TestSphere",true,false)
onready var Cam = get_tree().get_root().find_node("Camera",true,false)

onready var anim: Animation = get_animation("AttackNoa")
onready var track_id: int = anim.find_track(".:translation")
onready var key_id: int = anim.track_find_key(track_id, 10)

onready var start_pos = Sphere.global_transform.origin

func _process(delta):
	if is_playing():
		print(Character.global_transform.origin, ' ', start_pos, ' ', Sphere.global_transform.origin)
#		print(anim.track_get_key_value(track_id, key_id))
		anim.track_set_key_value(track_id, key_id, get_target_position())


func get_target_position():
	return Character.global_transform.origin;
