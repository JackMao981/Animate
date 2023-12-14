extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	animate()
	move()
	move_and_slide()

func animate():
	if (velocity.y != 0):
		$Character.hide_and_show($Character/Jump) 		
		$AnimationPlayer.play("jump")				
	elif (Input.is_action_pressed("right")):
		$Character.flip_all_h(false)
		$Character.hide_and_show($Character/Walk) 
		$AnimationPlayer.play("walk")
	elif (Input.is_action_pressed("left")):
		$Character.flip_all_h(true)
		$Character.hide_and_show($Character/Walk) 		
		$AnimationPlayer.play("walk")		
	else:
		$Character.hide_and_show($Character/Idle)
		$AnimationPlayer.play("idle")

func move():
	if(Input.is_action_pressed("right")):
		velocity.x = SPEED
	if(Input.is_action_pressed("left")):
		velocity.x = -SPEED
	if(!Input.is_anything_pressed()):
		velocity.x = 0
		
