extends StaticBody2D

export (Array) var get_item_list

signal gotIt

var already = false

func _on_Area2D_body_entered(body):
	if body is Player && already == false:
		$Button.visible = true

func _on_Area2D_body_exited(body):
	if body is Player:
		$Button.visible = false

func _on_Button_pressed():
	emit_signal("gotIt")
	$light.visible = false
	$Unopen.visible = false
	$Open.visible = true
	
	already = true
