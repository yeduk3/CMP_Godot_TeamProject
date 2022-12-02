extends ItemSlot

onready var is_active = true


func _on_MakingSlot_gui_input(event):
	if event.is_action_pressed("click"):
		print(str(item_in_slot.info["Description"]))
