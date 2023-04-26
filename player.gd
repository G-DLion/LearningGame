extends CharacterBody2D


var speed = 500
var jampForce = 1500
var gravity = 700
var velocityLimit = 200

var toggle = true
var toggle2 = true

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
			velocity -= velocity.normalized() * delta * speed*2
		else:
			velocity = Vector2.ZERO
	else:
		velocity += input * delta * speed*2
		velocity = velocity.limit_length(velocityLimit)
	if Input.is_action_pressed("flash") and toggle == true:
		print(toggle)
		if toggle:
			velocity += input * delta * speed*1000
			velocityLimit += 30000
			toggle =  false
		velocityLimit = 200
	if Input.is_action_just_released("flash"):
		if toggle2:
			$Timer.start(4)
			toggle2 = false
		
	print($Timer.time_left)
	move_and_slide()
	


func _on_area_2d_return_cam():
	$Camera2D.make_current()


func _on_timer_timeout():
	toggle = true
	toggle2 = true
