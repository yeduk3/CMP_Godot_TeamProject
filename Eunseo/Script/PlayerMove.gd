extends KinematicBody2D

var velocity = Vector2()
export var speed = 200

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
   
	velocity = move_and_slide(velocity)
