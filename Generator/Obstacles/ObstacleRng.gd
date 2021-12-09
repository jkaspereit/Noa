extends Node

var placed_already = false

func place_obstacle(q):
	if is_test_mode():
		return false
	var p = randf()
	if p <= q or placed_already:
		placed_already = false
		return false
	placed_already = true
	return true

func is_test_mode():
	var noa_endless_node = get_tree().get_root().find_node('NoaEndless',true,false)
	if noa_endless_node == null:
		return false
	return true
