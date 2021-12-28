extends Spatial

func _ready():
	var q = randf()
	# unlucky bro, no coins for you
	if q <= 0.5:
		queue_free()
