extends Spatial

const BASIC = 0
const TENT = 1
const SHOP = 2
const SETTINGS = 3

var processing_enabled = true

func _on_Tent_input_event(camera, event, click_position, click_normal, shape_idx):
	if is_valid(event):
		get_tree().call_group('Interface','to_selection')

func _on_Shop_input_event(camera, event, click_position, click_normal, shape_idx):
	if is_valid(event):
		get_tree().call_group('Interface','to_shop')

func _on_Settings_input_event(camera, event, click_position, click_normal, shape_idx):
	if is_valid(event):
#		get_tree().call_group('Interface','to_settings')
		get_tree().call_group('Interface','to_leaderboard')

func _on_Area_input_event(camera, event, click_position, click_normal, shape_idx):
	if is_valid(event):
		get_tree().call_group('Interface','play')

func is_valid(event):
	return processing_enabled and event.is_action("click") and event.is_pressed()

func game_over():
	processing_enabled = true

func to_home():
	processing_enabled = true

func to_shop():
	processing_enabled = false

func to_selection():
	processing_enabled = false

func to_settings():
	processing_enabled = false

func to_leaderboard():
	processing_enabled = false

func play():
	processing_enabled = false
