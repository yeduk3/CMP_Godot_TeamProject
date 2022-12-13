extends KinematicBody2D
onready var player = get_node("../player")
onready var sprite = $AnimatedSprite
var velocity = Vector2()
export var zom = 1
export var speed = 50

enum ANIM_STATE{
	WALK,
	ATTACK,
}
var anim_state = null

func _ready() -> void:
	anim_state = ANIM_STATE.WALK
	$AnimatedSprite.play("walk")
	speed = 10
	if zom == -1:
		$AnimatedSprite.flip_h = true
	pass
	
func _physics_process(delta: float) -> void:
	if is_on_wall():
		zom = zom *-1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		velocity.y += 20
		velocity.x = speed * zom
		velocity = move_and_slide(velocity,Vector2.UP)

func _process(delta):
	#if player.get_position_in_parent() < 
		
	if Input.is_action_pressed("ui_right"):	
	#if player.position > position:
		#sprite.flip_h = false
		sprite.play("attack")
	elif Input.is_action_pressed("ui_left"):
	#elif player.position < position:
		#sprite.flip_h = true
		sprite.play("walk")
	else:
		sprite.stop()
		
		
		
	if player:
		var direction = (player.position - position).normalized()
		move_and_slide(direction * speed)
		for i in get_slide_count():
			var collision = get_slide_collision(i)
