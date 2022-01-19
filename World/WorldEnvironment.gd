extends WorldEnvironment

func to_shop():
	$AnimationPlayer.play("Blur");

func to_leaderboard():
	$AnimationPlayer.play("Blur");

func to_selection():
	$AnimationPlayer.play("Blur");

func to_settings():
	$AnimationPlayer.play("Blur");

func to_home(from):	
	$AnimationPlayer.play_backwards("Blur")

func game_over():
	blur_on()

func at_home():
	environment.adjustment_saturation = 1
	blur_off()

func forest_god_off():
	$AnimationPlayer.play_backwards("ForestGod")

func forest_god_on():
	$AnimationPlayer.play("ForestGod")

func blur_on():
	environment.dof_blur_far_amount = 0.13
	environment.dof_blur_near_amount = 0.13

func blur_off():
	environment.dof_blur_far_amount = 0
	environment.dof_blur_near_amount = 0
