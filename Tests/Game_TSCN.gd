extends TextureRect

func _process(delta):
	texture = $Viewport.get_texture()
