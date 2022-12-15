extends Node2D

onready var dialog_box = $DialogBox
onready var timer = $DialogBox/Timer

var have_key = false

var timeout = false

var stat = StatManager
var prevscene

func _on_MainGate_body_entered(body):
	if body is Player:
		dialog_box.set_dialog("res://Eunseo/Dialog/json/MainGateDialog.json")
		visible = true


func _on_ExitArea_body_entered(body):
	if body is Player:
		if have_key == false:
			dialog_box.set_dialog("res://Eunseo/Dialog/json/ExitDialogNOKEY.json")
			visible = true
		else:
			pass

func isProlog():
	dialog_box.set_dialog("res://Eunseo/Dialog/json/PrologDialog.json")
	visible = true

func isEnding1():
	dialog_box.set_dialog("res://Eunseo/Dialog/json/Ending1Dialog.json")
	visible = true

func use_MeetMonsterDialog():
	dialog_box.set_dialog("res://Eunseo/Dialog/json/MeetMonsterDialog.json")
	visible = true

func use_Normal1():
	
	yield(get_tree().create_timer(2.0), "timeout")
	dialog_box.set_dialog("res://Eunseo/Dialog/json/NormalEndingDialog1.json")
	visible = true

func use_Normal2():
	dialog_box.set_dialog("res://Eunseo/Dialog/json/NormalEndingDialog2.json")
	get_node("DialogBox").DialogNum = 1
	visible = true
	
func use_Normal3():
	dialog_box.set_dialog("res://Eunseo/Dialog/json/NormalEndingDialog3.json")
	visible = true


func _on_VideoArea_body_entered(body):
	$DialogBox.DialogNum = 0
	if body is Player:
		dialog_box.set_dialog("res://Eunseo/Dialog/json/VideoDialog1.json")
		visible = true
		var testNode = get_node("DialogBox")
		# 2. 그 신호를 여기서 받은 다음 self 노드의 _test_func 함수를 호출
		if not testNode.is_connected("hide_Dialog", self, "_test_func"):
			testNode.connect("hide_Dialog", self, "_test_func")
		if not testNode.is_connected("hide_Dialog2", self, "_second_test_func"):
			testNode.connect("hide_Dialog2", self, "_second_test_func")

func use_Happy():
	dialog_box.set_dialog("res://Eunseo/Dialog/json/HappyEndingDialog.json")
	visible = true
		
func _test_func():
	
	if stat._get_stat2() >= 2: # 60으로 맞추기 
		dialog_box.set_dialog("res://Eunseo/Dialog/json/VideoDialog3.json")
		visible = true
	else:
		dialog_box.set_dialog("res://Eunseo/Dialog/json/VideoDialog2.json")
		visible = true
	#get_tree().change_scene("res://VIdeo.tscn")	

func _second_test_func():
	$DialogBox.DialogNum = 0
	print("Received Second DIalog admfklajsdf")
"""
func use_Video2():
	#print('kkkk')
	dialog_box.set_dialog("res://Eunseo/Dialog/json/VideoDialog2.json")
	visible = true
	var testNode = get_node("DialogBox")
	testNode.disconnect("hide_Dialog", self, "_test_func")
	#testNode.connect("hide_Dialog", self, "_test_func")

func use_Video3():
	dialog_box.set_dialog("res://Eunseo/Dialog/json/VideoDialog3.json")
	visible = true
	var testNode = get_node("DialogBox")
	testNode.disconnect("hide_Dialog", self, "_test_func")
"""
