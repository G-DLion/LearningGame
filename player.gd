extends CharacterBody2D

var speed = 150
var jampForce = 500
var gravity = 700

var vel = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("player_left"):
		vel.x -= speed
	elif Input.is_action_pressed("player_right"):
		vel.x += speed
	
	move_and_slide(vel, Vector2.UP)
