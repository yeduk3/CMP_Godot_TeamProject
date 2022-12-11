extends Area2D

export var dialog_key = ""
var area_active = false

func _input(event):
	if area_active and event.is_action_pressed("ui_accept"):
		SignalBus.emit_signal("display_dialog",dialog_key)



func _on_DialogArea_body_entered(body):
	if body is Player:
		area_active = true
		


func _on_DialogArea_body_exited(body):
	if body is Player:
		area_active = false
