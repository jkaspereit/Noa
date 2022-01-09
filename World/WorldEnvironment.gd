extends WorldEnvironment


func game_over():
	environment.dof_blur_far_enabled = true

func at_home():
	environment.dof_blur_far_enabled = false
