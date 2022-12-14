extends KinematicBody2D


var speed = 50
var motion = Vector2.ZERO
var play = null
onready var sprite = $AnimatedSprite
onready var player = get_node("../Player")
var count = 3
var timer = Timer.new()
var time_hit = 0
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
	if "Map" in body.name:
		return
	print("entered")
	# 3초 무적이면 3000, 5초 무적이면 5000......
	if time_hit + 5000 > Time.get_ticks_msec():
		print('super')
	else:
		var health = $"../Player/PlayerUI/HealthBarTest/Health"
		health._health_down(10)
		time_hit = Time.get_ticks_msec()
		print('hit')
		_unbeatable_timer()
	


func _on_Area2D_body_exited(body):
	print("exited")
	play = null

func _unbeatable_timer(): 
	var health = $"../Player/PlayerUI/HealthBarTest/Health"
	while count > 0:
		health._health_down(0)
		count -= 1
		#print(count)
		$"../Player".set_collision_mask_bit(2, false)
		set_collision_mask_bit(0, false)
		#print("mask: " + str(collision_mask))
		yield(get_tree().create_timer(1.0), "timeout")
	count = 3
	set_collision_mask_bit(0, true)
	$"../Player".set_collision_mask_bit(2, true)
	#print("Unbeatable Timer off")
