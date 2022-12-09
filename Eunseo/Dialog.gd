extends Polygon2D

func _on_Text_hide():
	visible = false


func _on_Area2D_body_entered(body):
	visible = true


func _on_MainGate_body_entered(body):
	if "Map" in body.name:
		return
	visible = true

func _on_ExitArea_body_entered(body):
	visible = true

func _on_DeskUnlock_gotIt():
	visible = true
