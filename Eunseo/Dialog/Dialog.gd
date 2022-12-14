extends Node2D

onready var dialog_box = $DialogBox
onready var timer = $DialogBox/Timer

var have_key = false

var timeout = false


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

func isEnding1():
	dialog_box.set_dialog("res://Eunseo/Dialog/json/Ending1Dialog.json")
	visible = true

func use_MeetMonsterDialog():
	dialog_box.set_dialog("res://Eunseo/Dialog/json/MeetMonsterDialog.json")
	get_node("DialogBox").DialogNum = 1
	visible = true

func use_Normal1():
	
	yield(get_tree().create_timer(2.0), "timeout")
	dialog_box.set_dialog("res://Eunseo/Dialog/json/NormalEndingDialog1.json")
	visible = true

func use_Normal2():
	dialog_box.set_dialog("res://Eunseo/Dialog/json/NormalEndingDialog2.json")
	visible = true
