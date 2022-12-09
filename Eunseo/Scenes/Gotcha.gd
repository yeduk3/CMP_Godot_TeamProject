extends Polygon2D

onready var timer = get_node("Timer")

func _ready():
	timer.set_wait_time(2)
	timer.start()

func _on_Timer_timeout():
	visible = false

func _on_Box_gotIt():
	visible = true

func _on_Desk_front_gotIt():
	visible = true


func _on_Locker_gotIt():
	visible = true


func _on_Flower_gotIt():
	visible = true


func _on_Picture_gotIt():
	visible = true


func _on_Machine_gotIt():
	visible = true


func _on_Chemical_gotIt():
	visible = true
