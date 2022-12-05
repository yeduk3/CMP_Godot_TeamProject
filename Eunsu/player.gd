extends KinematicBody2D

#class_name redplayer
#class_name yellowplayer
#class_name greenplayer
class_name colorplayer

export (int) var speed = 200

var velocity
var points = 0
var health = 0

var red_p = 1
var yellow_h = 1
var green_s = 100

var no_of_coins = 3

var g_over = false

var Bplay = true

signal damage_taken (old_value, new_value)

func _ready():
	points = 0
	health = randi() % 10

func get_input():
	
	# initialize velocit
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	# calculate velocity by using speed
	velocity = velocity.normalized() * speed
	
func take_damage(amount):
	var old_health = health
	health -= amount
	
	if health < 0:
		health = 0
		
	# emit the signal
	emit_signal("damage_taken", old_health, health)
		

# it is recommended to move KinematicBody2D in _physics_process()
func _physics_process(delta):
	get_input()
	move_and_slide(velocity) # moves KinematicBody2D


func _on_red_body_entered(body):
	points += red_p
	no_of_coins -= 1
	
	print("Picked a coin! Points: ", str(points))
	
	#game over?
	if no_of_coins == 0:
		g_over = true
		print("All coins picked! Game Over!")
		get_tree().paused = true #pause the game
		
#그냥 버튼으로 구현하기
#버튼 누르면 창 뜨고 폴리건 창 거기서에서 버튼으로 소리 키우기, 일시정지 버튼 등등 구현하기




#func _on_Bmusic_input_event(viewport, event, shape_idx):
#	if event is InputEventMouseButton:
#		if event.is_pressed():
#			if Bplay == true:
#				Bplay = false
#			else:
#				Bplay = true
#		if Bplay == true:
#			bgm.play()
#			print("d")
			
