extends StaticBody2D

signal gotIt

var already = false


func _on_Area2D_body_entered(body):
	if body is Player && already == false:
		$Button.visible = true


func _on_Area2D_body_exited(body):
	if body is Player:
		$Button.visible = false

func _on_Button_pressed():
	get_tree().change_scene("res://Eunseo/Scenes/Password.tscn")
