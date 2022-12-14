extends KinematicBody2D

class_name Player

var velocity = Vector2()
var dash_available = true
onready var cooltimeVal = $PlayerUI/StaminaBarTest/Stamina

export var speed = 200
var dash_speed_delta = 100

var isRight = false
var isLeft = false
var isDown = false
var isUp = false
var Limit = false

func _get_start_time():
	return OS.get_ticks_msec()
	
# 대시 게이지를 채운다	
func _gauge_up():
	if cooltimeVal.current < 28.0:
		cooltimeVal.current += 0.3

# 대시 게이지를 소모한다
func _gauge_down():
	cooltimeVal.current -= 0.3
	
# 매 초마다 호출
func _process(delta):
	# 대시 게이지를 끝까지 써버리면 다시 다 찰 때까지 대시를 사용할 수 없다
	if cooltimeVal.current < 0.1:
		dash_available = false
	if cooltimeVal.current > 27.0:
		dash_available = true

func _physics_process(delta):

	velocity = Vector2(0,0)

	if Input.is_action_pressed("right"):
		velocity.x = speed
		isRight = true
	if Input.is_action_pressed("left"):
		velocity.x = -speed
		isLeft = true
	if Input.is_action_pressed("up"):
		velocity.y = -speed
		isUp = true
	if Input.is_action_pressed("down"):
		velocity.y = speed
		
		
		isDown = true
	if Input.is_action_pressed("dash") and dash_available:
		#velocity.x = speed + dash_speed_delta
		_gauge_down()
		if isRight == true:
			velocity.x = speed + dash_speed_delta
			isRight = false
		if isLeft == true:
			velocity.x = - (speed + dash_speed_delta)
			isLeft = false
		if isUp == true:
			velocity.y = - (speed + dash_speed_delta)
			isUp = false
		if isDown == true:
			velocity.y = speed + dash_speed_delta
			isDown = false
	else:
		_gauge_up()

	velocity - velocity.normalized()*speed

	velocity = move_and_slide(velocity, Vector2.UP)

func _on_EVtoB1_body_entered(body):
	if "Map" in body.name:
		return
	get_tree().change_scene("res://Main/MainB1F.tscn")


func _on_EVto1_body_entered(body):
	get_tree().change_scene("res://Main/Main1F.tscn")


func _on_MediArea_body_entered(body):
	pass
