extends ParallaxLayer

var Tree1 = preload("res://Assets/GFX/Environment/trees-pillars_pink_1.png")
var Tree2 = preload("res://Assets/GFX/Environment/trees-pillars_pink_2.png")
var Tree3 = preload("res://Assets/GFX/Environment/trees-pillars_pink_3.png")

func _ready():
	randomize()

func _on_TextureRect_tree_entered():
	motion_mirroring = Vector2(randi() % 2280,0)
	match randi() % 3:
		0: $TextureRect.texture = Tree1
		1: $TextureRect.texture = Tree2
		2: $TextureRect.texture = Tree3
