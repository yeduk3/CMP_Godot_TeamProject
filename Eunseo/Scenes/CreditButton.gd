extends Button

onready var credit = $"../Credit"


func _on_CreditButton_pressed():
	credit.visible = true

func _input(event):
	if credit.visible == true && event.is_action_pressed("left_click"):
		credit.visible = false
