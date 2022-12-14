extends Node2D

onready var dialog_box = $DialogBox

var have_key = false

func _on_MainGate_body_entered(body):
	if body is Player:
		dialog_box.set_dialog("res://Eunseo/Dialog/json/MainGateDialog.json")
		visible = true


func _on_Area2D_body_entered(body):
	if body is Player:
		dialog_box.set_dialog("res://Eunseo/Dialog/json/VideoDialog.json")
		visible = true


func _on_ExitArea_body_entered(body):
	if body is Player:
		if have_key == false:
			dialog_box.set_dialog("res://Eunseo/Dialog/json/ExitDialogNOKEY.json")
			visible = true
		else:
			pass
