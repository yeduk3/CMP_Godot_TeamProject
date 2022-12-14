extends KinematicBody2D


var speed = 50
var motion = Vector2.ZERO
var play = null
onready var sprite = $AnimatedSprite
onready var player = get_node("../player")
#onready var agent $NavigationAgent2D

func _process(delta):
	
		
	if player.position > position:
		sprite.flip_h = false
		sprite.play("run")
	elif player.position < position:
		sprite.flip_h = true
		sprite.play("run")
	else:
		sprite.stop()
		
		
	if player:
		var direction = (player.position - position).normalized()
		move_and_slide(direction * speed)
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			
	
	var ran = randi()
	if ran%200==0:
		Dash()

func Dash():
	speed = 200
	$Timer.start()

func _on_Timer_timeout():
	speed = 50
	
func _physics_process(delta):
	motion = Vector2.ZERO
	if play:
		motion = position.direction_to(play.position*speed)
	motion = move_and_slide(motion)


func _on_Area2D_body_entered(body):
	print("entered")
	play = body


func _on_Area2D_body_exited(body):
	print("exited")
	play = null
