extends CanvasLayer

onready var PlayIntegration = get_node("/root/PlayIntegration")

func _ready():
	PlayIntegration.sign_in();
