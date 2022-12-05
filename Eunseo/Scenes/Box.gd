extends StaticBody2D

signal gotIt


func _on_Area2D_body_entered(body):
	if body is Player:
		$Button.visible = true


func _on_Area2D_body_exited(body):
	if body is Player:
		$Button.visible = false

func _on_Button_pressed():
	emit_signal("gotIt")
	$light.visible = false
	$BoxUnopen.visible = false
	$BoxOpen.visible = true
