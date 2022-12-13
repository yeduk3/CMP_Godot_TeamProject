extends Node2D

onready var dialog_box = $DialogBox

func _on_MainGate_body_entered(body):
	if body is Player:
		dialog_box.set_dialog("res://Eunseo/Dialog/json/MainGateDialog.json")
		print(visible)
		visible = true
