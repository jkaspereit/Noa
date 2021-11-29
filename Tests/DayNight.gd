extends TextureRect

const DAY = Vector3(1,1,1)
const NIGHT = Vector3(0.25,0.75,0.25)
const DAY_TIME = 0.1

var time = 0

var its_night = false

func _process(delta):
	if(time < 1):
		time += delta * DAY_TIME
	else:
		time = 0
		its_night = !its_night
	var interpolation
	if its_night:
		interpolation = NIGHT.linear_interpolate(DAY,time)
	else:
		interpolation = DAY.linear_interpolate(NIGHT,time)
	set_self_modulate(Color(interpolation.x, interpolation.y, interpolation.z))
