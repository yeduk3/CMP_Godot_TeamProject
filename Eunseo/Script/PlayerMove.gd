extends KinematicBody2D

class_name Player

var velocity = Vector2()
export var speed = 200

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
   
	velocity = move_and_slide(velocity)


func _on_EVtoB1_body_entered(body):
	if "Map" in body.name:
		return
	get_tree().change_scene("res://Eunseo/Scenes/B1F.tscn")


func _on_EVto1_body_entered(body):
	get_tree().change_scene("res://Eunseo/Scenes/EunseoMap.tscn")


func _on_MediArea_body_entered(body):
	pass
