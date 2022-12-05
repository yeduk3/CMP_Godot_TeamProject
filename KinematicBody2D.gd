extends KinematicBody2D


var velocity = Vector2()
#var gravity = 300
var JUMP = -1500 # 점프는 위쪽으로 움직여야 하니까 마이너스


export var speed = 500

func _physics_process(delta):
	
	velocity = Vector2(0,0)
	
	if Input.is_action_pressed("right"):
		velocity.x = speed
	if Input.is_action_pressed("left"):
		velocity.x = -speed
	if Input.is_action_pressed("up"):
		velocity.y = -speed
	if Input.is_action_pressed("down"):
		velocity.y = speed

	
	#if Input.is_action_pressed("jump"):
#		velocity.y = JUMP
	
	#velocity - velocity.normalized()*speed
	
	velocity = move_and_slide(velocity, Vector2.UP)
	

