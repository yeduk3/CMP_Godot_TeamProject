extends Node2D

var vis_window = false


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

#함수 했던 것처럼 플레이어가 빨간 버튼 누르면 폴리건 보이게, 다시 누르면 폴레건 다시 사라지게


func _on_Bmusic_working_window(window):
	vis_window = window
	if vis_window == false:
		visible = false
	else:
		visible = true
