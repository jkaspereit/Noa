extends Spatial

export var q = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	if not ObstacleRng.place_obstacle(q):
		queue_free()

func _on_Area_body_entered(body):
	if body is KinematicBody:
		body.is_crashed()
		print("crashed")
