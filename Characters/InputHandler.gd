extends Node

var pressed_pos = Vector2(0,0)
const SWIPE_DISTANCE = 20

func _input(event):	
	if event.is_action_pressed("click"):
		pressed_pos = event.position
	if event.is_action_released("click"):
		var released_pos = event.position
		var distance = pressed_pos.distance_to(released_pos)
		if distance < SWIPE_DISTANCE:
			get_tree().call_group('Character','jump')
#		else: 
#			var angle = to_deg((released_pos - pressed_pos).angle())
#			calculate_swipe(angle)

func calculate_swipe(angle):
	if angle > 0 and angle < 90:
		get_tree().call_group('PathChanger','swipe_ES')
	elif angle > 90 and angle < 180:
		get_tree().call_group('PathChanger','swipe_SW')
	elif angle > 180 and angle < 270:
		get_tree().call_group('PathChanger','swipe_WN')
	elif angle > 270 and angle < 360:
		get_tree().call_group('PathChanger','swipe_NE')

func to_deg(rad):
	return int((rad2deg(rad) + 360)) % 360
