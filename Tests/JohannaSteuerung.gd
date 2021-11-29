extends KinematicBody

const TEXTURE_FORWARD = preload("res://Assets/GFX/Characters/2DCharacterTemplate/Walk_Forward.tres")
const TEXTURE_LEFT = preload("res://Assets/GFX/Characters/2DCharacterTemplate/Walk_Left.tres")
const TEXTURE_RIGHT = preload("res://Assets/GFX/Characters/2DCharacterTemplate/Walk_Right.tres")

const FORWARD = Vector3(0,0,-1)
const LEFT = Vector3(-1,0,0)
const RIGHT = Vector3(1,0,0)
const BACKWARD = Vector3(0,0,1)
onready var direction = FORWARD

const SPEED = 5

var path = Pathfinder.path

var time_start
var time_elapsed 
var swipe_buffer = []

var velocity = Vector3.ZERO
var gravity = 0

var can_double_jump = false

var dc = 0

func _physics_process(delta):
	look_forward()
	move()

func move():
	var velocity
	if dc > 0: 
		velocity = direction
		dc -= 1
	else: 
		velocity = direction * SPEED
	apply_gravity()
	velocity.y = gravity
	move_and_slide(velocity,Vector3.UP)

func apply_jump():
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			gravity += 20
			$DoubleJumpTimeWindow.start()
		elif not $DoubleJumpTimeWindow.is_stopped():
			gravity += 15

func jump():
	direction = FORWARD
	dc = 5

func swipe_left():
	direction = LEFT
	dc = 5

func swipe_right():
	direction = RIGHT
	dc = 5

func swipe_forward():
	direction = FORWARD
	dc = 5

func apply_gravity():
	if is_on_floor() and gravity < -4: 
		gravity = -5
	else:
		gravity -= 1

func get_move_direction():
	# direction is where we want to go
	var direction = path[0] - translation
	# normalize = v / v.length
	# but jumping shouldn't affect the distance to the next point
	# because it might seem like we are far away while being very close
	# due to height
	var length_2d = Vector2(direction.x,direction.z).length()
	# when we are close, we go on with the next waypoint
	if abs(length_2d) < 0.5:
		setup_next_waypoint()
	# don't divide by zero
	if not length_2d == 0 and not direction.length() == 0:
		# normalize x, z as in 2d, so that jumping doesn't affect the velocity
		direction.x = direction.x / length_2d
		direction.z = direction.z / length_2d
		# jumping itself, should be normalized as in 3d
		direction.y = direction.y / direction.length()
	return direction

func get_direction(pointA, pointB):
	# direction between the both point
	var direction3d = pointB - pointA
	if abs(direction3d.z) > abs(direction3d.x):
		return FORWARD
	elif direction3d.x > 0:
		return RIGHT
	else:
		return LEFT

func setup_next_waypoint():
	var current_direction = get_direction(translation, path[0])
	var next_direction = get_direction(path[0],path[1])
	var swipe_direction = null
	if swipe_buffer.size() > 0:
		swipe_direction = swipe_buffer[0]
	if current_direction == next_direction:
		path.remove(0)
	elif next_direction == swipe_direction:
		swipe_buffer.remove(0)
		path.remove(0)
	else:
		path[0] += current_direction

func look_forward():
	if velocity.x > 8:
		$MeshInstance.mesh.material.albedo_texture = TEXTURE_RIGHT
	elif velocity.x < -8:
		$MeshInstance.mesh.material.albedo_texture = TEXTURE_LEFT
	else: 
		$MeshInstance.mesh.material.albedo_texture = TEXTURE_FORWARD

