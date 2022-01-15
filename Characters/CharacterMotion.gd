extends KinematicBody

const SPEED = 6.5

const STARTING_POS = Vector3(-5.5,-1,17)

var time_start
var time_elapsed 

var velocity = Vector3.ZERO
var gravity = 0

var processing_enabled = false

func _physics_process(delta):
	if processing_enabled:
		move()
		look_forward()

func _input(event):
	if processing_enabled and event.is_action_pressed('click'):
		jump()

func move():
	var direction = get_direction()
	# apply speed
	velocity = direction * SPEED
	# apply jump and gravity
	apply_gravity()
	# move
	move_and_slide(velocity,Vector3.UP)
	# call it a game, when noa has fallen
	if has_fallen():
		get_tree().call_group('Interface','game_over')

func jump():
	if is_on_floor():
		gravity += 20

func apply_gravity():
	if is_on_floor() and gravity < -4: 
		gravity = -5
	else:
		gravity -= 1
	velocity.y += gravity 

func get_direction():
	# direction is where we want to go
	var direction = Pathfinder.path[0] - translation
	# normalize = v / v.length
	# but jumping shouldn't affect the distance to the next point
	# because it might seem like we are far away while being very close
	# due to height
	var length_2d = Vector2(direction.x,direction.z).length()
	# when we are close, we go on with the next waypoint
	if abs(length_2d) < 0.25:
		Pathfinder.path.remove(0)
		Gamestate.raise_distance()
	# don't divide by zero
	if not length_2d == 0 and not direction.length() == 0:
		# normalize x, z as in 2d, so that jumping doesn't affect the velocity
		direction.x = direction.x / length_2d
		direction.z = direction.z / length_2d
		# jumping itself, should be normalized as in 3d
		direction.y = direction.y / direction.length()
	return direction

func look_forward():
	if velocity.x > SPEED - 1:
		$MeshInstance.mesh.material.albedo_texture = CharacterTextureLoader.get_right()
	elif velocity.x < - SPEED + 1:
		$MeshInstance.mesh.material.albedo_texture = CharacterTextureLoader.get_left()
	else: 
		$MeshInstance.mesh.material.albedo_texture = CharacterTextureLoader.get_forward()

func has_fallen():
	var CharHeight = translation.y
	var PathHeight = Pathfinder.path[0].y
	if PathHeight - CharHeight > 5:
		return true
	return false

func play():
	processing_enabled = true

func game_over():
	reset()
	processing_enabled = false

func reset():
	load_home_texture()
	set_translation(STARTING_POS)

func load_home_texture():
	$MeshInstance.mesh.material.albedo_texture = CharacterTextureLoader.get_home()
