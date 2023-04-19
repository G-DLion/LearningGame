extends CharacterBody2D

var speed = 2
var jampForce = 500
var gravity = 700

var vel = Vector2(0,0)

func _physics_process(delta):
	if Input.is_action_pressed("Player_Left"):
		vel.x -= speed
	elif Input.is_action_pressed("Player_Rihgt"):
		vel.x += speed
	vel = vel.normalized() * speed
	position.x += vel.x
	vel = Vector2(0,0)
	
	
