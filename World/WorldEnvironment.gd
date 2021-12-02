extends WorldEnvironment


func enable_blur():
	environment.dof_blur_near_enabled = true

func disable_blur():
	environment.dof_blur_near_enabled = false
