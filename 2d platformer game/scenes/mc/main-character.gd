extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -900.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@export var Particle : PackedScene
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_count = 0
func jump():
	velocity.y = JUMP_VELOCITY
func side_jump(x):
	velocity.y = JUMP_VELOCITY
	velocity.x = x

func _physics_process(delta):

	
	if is_on_floor():
		jump_count = 0
			# Add the gravity.
		if (velocity.x > 1 || velocity.x < -1):
			animated_sprite_2d.animation = "running"
		else:
			animated_sprite_2d.animation = "default"
	else:
		velocity.y += gravity * delta
		if (jump_count == 2):
			animated_sprite_2d.animation = "double jump"
		else:
			animated_sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and jump_count < 2:
		velocity.y = JUMP_VELOCITY
		jump_count += 1
		if (jump_count == 2):
			spawn_dust()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 100)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	animated_sprite_2d.flip_h = isLeft

func spawn_dust():
	var particle_node = Particle.instantiate()
	particle_node.position = position
	get_parent().add_child(particle_node)
	await get_tree().create_timer(0.3).timeout
	particle_node.queue_free()
