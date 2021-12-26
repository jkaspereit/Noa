extends Spatial

export var offset = Vector3(0,0,0)

onready var Character = get_tree().get_root().find_node("Char",true,false)
onready var LetItRain = get_tree().get_root().find_node("LetItRain",true,false)

# we don't won't to start with rain
var its_raining = true

func _process(delta):
	var temp = offset + Character.translation
	set_translation(Vector3(temp.x,temp.y,temp.z))

func _on_LetItRain_timeout():
	var next_rain_event = randi() % 36
	# Disable Rain
	if its_raining:
		visible = false
		its_raining = false
	# LetItRain
	else: 
		visible = true
		its_raining = true
	# start the timer, to let the event go on
	$LetItRain.wait_time = next_rain_event
	$LetItRain.start()


# intial call to activate rain
func _on_LetItRain_tree_entered():
#	_on_LetItRain_timeout()
	pass
