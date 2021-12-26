extends KinematicBody

var TEXTURE_FORWARD = preload("res://Assets/GFX/Characters/2DCharacterTemplate/Walk_Forward.tres")
var TEXTURE_LEFT = preload("res://Assets/GFX/Characters/2DCharacterTemplate/Walk_Left.tres")
var TEXTURE_RIGHT = preload("res://Assets/GFX/Characters/2DCharacterTemplate/Walk_Right.tres")

const SPEED = 4

const STARTING_POS = Vector3(-6,-1,15.5)

var time_start
var time_elapsed 

var velocity = Vector3.ZERO
var gravity = 0

var can_double_jump = false

var is_crashed = false

var pauseCharacter = false

func _physics_process(delta):
	if not Gamestate.game_running:
		return
	if is_dead():
		Gamestate.game_over()
	else:
		look_forward()
		move()

func move():
	var direction = get_direction()
	# apply speed
	velocity = direction * SPEED
	# apply jump and gravity
	apply_gravity()
	# move
	move_and_slide(velocity,Vector3.UP)

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
		# Give the player some score points
		Gamestate.raise_score(1)
	# don't divide by zero
	if not length_2d == 0 and not direction.length() == 0:
		# normalize x, z as in 2d, so that jumping doesn't affect the velocity
		direction.x = direction.x / length_2d
		direction.z = direction.z / length_2d
		# jumping itself, should be normalized as in 3d
		direction.y = direction.y / direction.length()
	return direction


func look_forward():
	if velocity.x > 8:
		$MeshInstance.mesh.material.albedo_texture = TEXTURE_RIGHT
	elif velocity.x < -8:
		$MeshInstance.mesh.material.albedo_texture = TEXTURE_LEFT
	else: 
		$MeshInstance.mesh.material.albedo_texture = TEXTURE_FORWARD


func is_dead():
	return has_fallen() or is_crashed

func has_fallen():
	var CharHeight = translation.y
	var PathHeight = Pathfinder.path[0].y
	if PathHeight - CharHeight > 5:
		return true
	return false

func is_crashed():
	is_crashed = true

func reset():
	set_translation(STARTING_POS)
