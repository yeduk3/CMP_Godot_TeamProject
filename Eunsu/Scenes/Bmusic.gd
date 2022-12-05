extends Area2D

var Bplay = true
signal working_window (window) 
#
# 함수 불러들이기 부터 시작
#

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_Bmusic_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT :
		if event.is_pressed():
			if Bplay == true:
				Bplay = false
				print("false1")
			else:
				Bplay = true
				print("true1")
	emit_signal("working_window", Bplay)
				
