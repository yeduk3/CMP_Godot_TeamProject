extends Control

onready var timer = get_node("Timer")
var timeout = false

var Key1 = "_"
var Key2 = "_"
var Key3 = "_"
var Key4 = "_"

var next = 1
	
func _process(delta):
	$Key1Label.text = str(Key1)
	$Key2Label.text = str(Key2)
	$Key3Label.text = str(Key3)
	$Key4Label.text = str(Key4)
	
	if next > 5:
		next = 5
		
	if timeout == true:
		get_tree().change_scene("res://Eunseo/Scenes/Ending1.tscn")

func _on_Timer_timeout():
	timer.stop()
	timeout = true
	
func _on_ButtonDel_pressed():
	
	Key1 = "_"
	Key2 = "_"
	Key3 = "_"
	Key4 = "_"
	
	next = 1
	$Lock.text = "Lock"


func _on_ButtonEnter_pressed():
	$Lock.text = "Error"

	if next == 5:
		if Key1 == 2 && Key2 == 5 && Key3 == 1 && Key4 == 8:
			timer.start()
			$Lock.text = "Unlock"


func _on_Button1_pressed():
	if next == 1:
		Key1 = 1
	if next == 2:
		Key2 = 1 
	if next == 3:
		Key3 = 1 
	if next == 4:
		Key4 = 1 
	
	next += 1


func _on_Button2_pressed():
	if next == 1:
		Key1 = 2
	if next == 2:
		Key2 = 2 
	if next == 3:
		Key3 = 2 
	if next == 4:
		Key4 = 2 
	
	next += 1


func _on_Button3_pressed():
	if next == 1:
		Key1 = 3
	if next == 2:
		Key2 = 3 
	if next == 3:
		Key3 = 3 
	if next == 4:
		Key4 = 3 
	
	next += 1


func _on_Button4_pressed():
	if next == 1:
		Key1 = 4
	if next == 2:
		Key2 = 4 
	if next == 3:
		Key3 = 4 
	if next == 4:
		Key4 = 4 
	
	next += 1


func _on_Button5_pressed():
	if next == 1:
		Key1 = 5
	if next == 2:
		Key2 = 5 
	if next == 3:
		Key3 = 5 
	if next == 4:
		Key4 = 5 
	
	next += 1


func _on_Button6_pressed():
	if next == 1:
		Key1 = 6
	if next == 2:
		Key2 = 6 
	if next == 3:
		Key3 = 6 
	if next == 4:
		Key4 = 6 
	
	next += 1


func _on_Button7_pressed():
	if next == 1:
		Key1 = 7
	if next == 2:
		Key2 = 7 
	if next == 3:
		Key3 = 7 
	if next == 4:
		Key4 = 7 
	
	next += 1


func _on_Button8_pressed():
	if next == 1:
		Key1 = 8
	if next == 2:
		Key2 = 8 
	if next == 3:
		Key3 = 8 
	if next == 4:
		Key4 = 8 
	
	next += 1


func _on_Button9_pressed():
	if next == 1:
		Key1 = 9
	if next == 2:
		Key2 = 9 
	if next == 3:
		Key3 = 9 
	if next == 4:
		Key4 = 9 
		Key4 = 9 
	
	next += 1




