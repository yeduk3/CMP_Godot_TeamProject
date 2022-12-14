extends KinematicBody2D

var speed = 50
onready var sprite = $AnimatedSprite
onready var player = get_node("../player")

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = false
		sprite.play("attack")
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = true
		sprite.play("attack")
	else:
		sprite.stop()
		
		
		
	if player:
		var direction = (player.position - position).normalized()
		move_and_slide(direction * speed)
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			#if collision.collider.name == "player":
			#var object = collision.collider
			#if object.is_in_group("player"):
			#	object.hurt()
