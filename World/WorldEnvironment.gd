extends WorldEnvironment


func game_over():
	environment.dof_blur_far_enabled = true

func to_home():
	environment.dof_blur_far_enabled = false
