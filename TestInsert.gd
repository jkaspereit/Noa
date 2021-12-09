extends Spatial

var path = PoolVector3Array()

func is_test_mode():
	var test_node_exist = get_tree().get_root().find_node('NoaEndless',true,false)
	if not test_node_exist == null:
		return false
	return true
