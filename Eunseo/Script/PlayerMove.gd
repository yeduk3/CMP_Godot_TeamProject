extends KinematicBody2D

class_name Player

var velocity = Vector2()
var isCooldown = false
var currTime

export var speed = 500

func _get_start_time():
	return OS.get_ticks_msec()

func _set_cooldown(currTime):
	var cooltimeVal = $HealthBarTest/Health
	# 1000은 스킬 쿨타임(1초)
	cooltimeVal.current = (OS.get_ticks_msec() - currTime) / 1000.0 * 28.0
	if OS.get_ticks_msec() - currTime >= 1000:
		isCooldown = false
	
# 매 초마다 호출
func _process(delta):
	if isCooldown:
		_set_cooldown(currTime)
	
	if Input.is_action_just_pressed("tmpSkill") and not isCooldown:
		# 스킬 키를 누르면, currTime에 누른 시점의 시간을 저장 
		currTime = _get_start_time()
		isCooldown = true
	
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
	if Input.is_action_pressed("dash"):
		velocity.x = speed+500
		
	
	velocity - velocity.normalized()*speed
	
	velocity = move_and_slide(velocity, Vector2.UP)



