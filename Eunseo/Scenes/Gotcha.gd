extends Polygon2D

onready var timer = get_node("Timer")
onready var gotcha_text = $GotchaText

func _ready():
	timer.set_wait_time(2)
	timer.start()

func _on_Timer_timeout():
	visible = false

func _on_gotIt(list):
	var counted_list = {}
	for item in list:
		if counted_list.has(item):
			# increase quantity only
			counted_list[item] += 1
		else:
			# add item and quantity
			counted_list[item] = 1
	
	gotcha_text.text = "Get:\n"
	for key in counted_list.keys():
		gotcha_text.text += str(key, " ", counted_list[key], "\n")
	
	visible = true
