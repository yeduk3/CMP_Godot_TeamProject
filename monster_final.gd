extends KinematicBody2D


var velocity = Vector2()
onready var agent = $NavigationAgent2D

var speed = 170
var motion = Vector2.ZERO
var play = null
var attackk = false
var damage = false
onready var sprite = $AnimatedSprite
onready var player = get_node("../../Player")

var count = 3
var timer = Timer.new()
var time_hit = 0

func _ready():
	if not EndingManager.is_monster_exist():
		queue_free()
	
	$Timer2.connect("timeout", self, "update_pathfinding")
	update_pathfinding()

func update_pathfinding():
   #print("Path Update")
	agent.set_target_location(player.global_position)

func _physics_process(delta):
	if agent.is_navigation_finished():
		return

	# get direction to the next location from the navigation agent
	var direction = global_position.direction_to(agent.get_next_location())
	#print(str("NextPOs: ", direction))

	# Set velocity toward the next location and move
	velocity = direction.normalized() * speed
	move_and_slide(velocity)

func _process(delta):

	if attackk == true:
		sprite.play("attack")
	else:
		if player.position > position:
			sprite.flip_h = false
			sprite.play("walk")
		elif player.position < position:
			sprite.flip_h = true
			sprite.play("walk")
	
	if sprite.animation == "attack" and sprite.frame == 3 and not damage:
		print("Attackakakakak")
		damage = true
		# if player is in area
		
		if play:
			var health = $"../../Player/PlayerUI/HealthBarTest/Health"
			health._health_down(10)
			$msound.play()
		else:
			$msound.stop()



	var ran = randi()
	if ran%200==0:
		Dash()

func Dash():
	speed = 200
	$Timer.start()

func _on_Timer_timeout():
	speed = 170

func _on_Area2D_body_entered(body):
	if "Map" in body.name:
		return
	if body is Player:
		print("entered")
		play = body
		attackk = true
		# 3초 무적이면 3000, 5초 무적이면 5000......
		if time_hit + 5000 > Time.get_ticks_msec():
			print('super')
		else:
			#var health = $"../../Player/PlayerUI/HealthBarTest/Health"
			#health._health_down(10)
			time_hit = Time.get_ticks_msec()
			print('hit')
			_unbeatable_timer()

func _on_Area2D_body_exited(body):
	if body is Player:
		print("exited")
		play = null
		attackk = false

func _unbeatable_timer():
	var health = $"../../Player/PlayerUI/HealthBarTest/Health"
	while count > 0:
		health._health_down(0)
		count -= 1
		#print(count)
		$"../../Player".set_collision_mask_bit(2, false)
		set_collision_mask_bit(0, false)
		#print("mask: " + str(collision_mask))
		yield(get_tree().create_timer(1.0), "timeout")
	count = 3
	set_collision_mask_bit(0, true)
	$"../../Player".set_collision_mask_bit(2, true)
	#print("Unbeatable Timer off")


func _on_AnimatedSprite_animation_finished():
	damage = false
