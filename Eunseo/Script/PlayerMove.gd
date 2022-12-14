extends KinematicBody2D

class_name Player

var velocity = Vector2()
var dash_available = true
onready var cooltimeVal = $PlayerUI/StaminaBarTest/CooltimeBar

export var speed = 200
var dash_speed_delta = 100

var isRight = false
var isLeft = false
var isDown = false
var isUp = false

func _get_start_time():
	return OS.get_ticks_msec()
	
# 대시 게이지를 채운다	
func _gauge_up():
	if cooltimeVal.value < 100.0:
		cooltimeVal.value += 1.0
	pass

# 대시 게이지를 소모한다
func _gauge_down():
	print('a')
	cooltimeVal.value -= 1.0
	
# 매 초마다 호출
func _process(delta):
	# 대시 게이지를 끝까지 써버리면 다시 다 찰 때까지 대시를 사용할 수 없다
	if cooltimeVal.value < 2.0:
		dash_available = false
	if cooltimeVal.value > 98.0:
		dash_available = true

func _physics_process(delta):

	velocity = Vector2(0,0)

	if Input.is_action_pressed("right"):
		velocity.x = speed
		$Sprite.flip_h = false
		isRight = true
	if Input.is_action_pressed("left"):
		velocity.x = -speed
		$Sprite.flip_h = true
		isLeft = true
		# 아이템 먹었을때 넣어
		var test = $PlayerUI/AbilityBar1
		test._ability_up(1)
		
	if Input.is_action_pressed("up"):
		velocity.y = -speed
		isUp = true
		var test = $PlayerUI/AbilityBar2
		test._ability_up(1)
		
	if Input.is_action_pressed("down"):
		velocity.y = speed
		isDown = true
<<<<<<< Updated upstream
=======
		var test = $PlayerUI/AbilityBar3
		test._ability_up(1)
		
		
>>>>>>> Stashed changes
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
