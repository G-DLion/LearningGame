extends CharacterBody2D

var speed = 400
var jampForce = 500
var gravity = 700

var input = Vector2.ZERO

func _physics_process(delta):
	move_player(delta)

	
func get_input():
	input.x = int(Input.is_action_pressed("Player_Rihgt")) - int(Input.is_action_pressed("Player_Left"))
	return input.normalized()

func move_player(delta):
	input = get_input()
	
	print(velocity.length())
	
	if input == Vector2.ZERO:
		if  velocity.length() * delta > (20 * delta):
			velocity -= velocity.normalized() * delta * speed
		else:
			velocity = Vector2.ZERO
	else:
		velocity += input * delta * speed
		velocity = velocity.limit_length(speed)
	
	move_and_slide()
	
