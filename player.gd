extends CharacterBody2D

var speed = 500
var jampForce = 1500
var gravity = 700

var input = Vector2.ZERO


func _ready():
	pass
		
		
func _physics_process(delta): 
	move_player(delta)
	flip_character()
	


func get_input():
	input.x = int(Input.is_action_pressed("Player_Right")) - int(Input.is_action_pressed("Player_Left"))
	input.y = int(Input.is_action_pressed("Player_Down")) - int(Input.is_action_pressed("Player_Up"))
	return input.normalized()
	
func flip_character():
	if velocity.x < -0.1:
		$characterSprite.flip_h = true
	elif velocity.x > 0.1:
		$characterSprite.flip_h = false
	
func move_player(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if  velocity.length() * delta > (20 * delta):
			velocity -= velocity.normalized() * delta * speed
		else:
			velocity = Vector2.ZERO
	else:
		velocity += input * delta * speed
		velocity = velocity.limit_length(speed/2)
		
	
	move_and_slide()
	
