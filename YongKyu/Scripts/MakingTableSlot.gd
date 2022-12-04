extends ItemSlot

onready var is_active = true


func _on_MakingSlot_gui_input(event):
	if not is_active:
		return
	if not item_in_slot:
		return
	if event.is_action_pressed("left_click"):
		print(str(item_in_slot.info["Description"]))
