extends KinematicBody2D


var speed = 50
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
		print("A")
		Dash()

func Dash():
	speed = 200
	$Timer.start()

func _on_Timer_timeout():
	speed = 50
