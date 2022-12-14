extends KinematicBody2D


var velocity = Vector2()
onready var agent = $NavigationAgent2D

var speed = 170
var motion = Vector2.ZERO
var play = null
var attackk = false
onready var sprite = $AnimatedSprite
onready var player = get_node("../../player")
#onready var agent $NavigationAgent2D

func _ready():
   $Timer2.connect("timeout", self, "update_pathfinding")
   update_pathfinding()
   
func update_pathfinding():
   print("Path Update")
   agent.set_target_location(player.global_position)
   
func _physics_process(delta):
	if agent.is_navigation_finished():
		return

	# get direction to the next location from the navigation agent
	var direction = global_position.direction_to(agent.get_next_location())
	print(str("NextPOs: ", direction))
   
	# Set velocity toward the next location and move
	velocity = direction.normalized() * speed
	move_and_slide(velocity)

func _process(delta):
   
	if attackk == true:
		sprite.play("attack")   
   #else:
   #   sprite.play("walk")   
	  
	  
	if player.position > position:
		sprite.flip_h = false
		sprite.play("walk")
	elif player.position < position:
		sprite.flip_h = true
		sprite.play("walk")
	else:
		#sprite.stop()
		sprite.play("attack")
   
		"""
   if player:
	  var direction = (player.position - position).normalized()
	  move_and_slide(direction * speed)
	  for i in get_slide_count():
		 var collision = get_slide_collision(i)
		 """
   
	var ran = randi()
	if ran%200==0:
		Dash()

func Dash():
   speed = 200
   $Timer.start()

func _on_Timer_timeout():
   speed = 50



func _on_Area2D_body_entered(body):
   print("entered")
   play = body
   attackk = true


func _on_Area2D_body_exited(body):
   print("exited")
   play = null
   attackk = false
