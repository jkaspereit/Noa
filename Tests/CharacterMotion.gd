extends KinematicBody

const TEXTURE_FORWARD = preload("res://Assets/GFX/Characters/2DCharacterTemplate/Walk_Forward.tres")
const TEXTURE_LEFT = preload("res://Assets/GFX/Characters/2DCharacterTemplate/Walk_Left.tres")
const TEXTURE_RIGHT = preload("res://Assets/GFX/Characters/2DCharacterTemplate/Walk_Right.tres")

const SPEED = 6.5

var path = Pathfinder.path

var time_start
var time_elapsed 

var velocity = Vector3.ZERO
var gravity = 0

var can_double_jump = false

func _physics_process(delta):
	look_forward()
	move()

func move():
	# we can only move, if ther is a path
	if path.size() > 0:
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
	var direction = path[0] - translation
	# normalize = v / v.length
	# but jumping shouldn't affect the distance to the next point
	# because it might seem like we are far away while being very close
	# due to height
	var length_2d = Vector2(direction.x,direction.z).length()
	# when we are close, we go on with the next waypoint
	if abs(length_2d) < 0.25:
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
