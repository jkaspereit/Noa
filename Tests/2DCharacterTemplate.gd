extends KinematicBody

const TEXTURE_FORWARD = preload("res://Assets/GFX/Characters/2DCharacterTemplate/Walk_Forward.tres")
const TEXTURE_LEFT = preload("res://Assets/GFX/Characters/2DCharacterTemplate/Walk_Left.tres")
const TEXTURE_RIGHT = preload("res://Assets/GFX/Characters/2DCharacterTemplate/Walk_Right.tres")

const SPEED = 10

var path = Pathfinder.path

var time_start
var time_elapsed 

var velocity = Vector3.ZERO
var gravity = 0

var double_jump = false

func _physics_process(delta):
	look_forward()
	move()

func move():
	# we can only move, if ther is a path
	if path.size() > 0:
		var direction = get_direction()
		# apply speed
		velocity = direction * SPEED
		# apply gravity
#		apply_gravity_hold_jump()
		apply_gravity_double_jump()
		# move
		move_and_slide(velocity,Vector3.UP)

func apply_gravity_double_jump():
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		gravity += 20
	elif is_on_floor(): 
		gravity = -5
		double_jump = false
	elif Input.is_action_just_pressed("jump") and not double_jump:
		gravity += 10
		double_jump = true
	else:
		gravity -= 1
	velocity.y += gravity 

func apply_gravity_hold_jump():
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		time_start = OS.get_ticks_msec()
		print('Timer Start:', time_start)
	elif is_on_floor() and Input.is_action_just_released("jump"):
		time_elapsed = OS.get_ticks_msec() - time_start
		print('Differenz:', time_elapsed)
		var jump_boost = time_elapsed / 25
		gravity += 20 + jump_boost
	elif is_on_floor(): 
		gravity = -5
	else:
		gravity -= 2
	velocity.y += gravity 

func get_direction():
	# direction is where we want to go
	var direction = path[0] - translation
	# normalize = v / v.length
	# but jumping shouldn't affect the distance to the next point
	# because it might seem like we are far away while being very close
	# due to height
	var length_2d = Vector2(direction.x,direction.z).length()
	# when we are close, we go on with the next waypoint
	if abs(length_2d) < 0.5:
		path.remove(0)
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
