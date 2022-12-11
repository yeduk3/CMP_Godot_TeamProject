extends Node2D

var dialogPath = ""

func _on_MainGate_body_entered(body):
	if body is Player:
		dialogPath = "res://Eunseo/Dialog/json/MainGateDialog.json"
		print(visible)
		visible = true
