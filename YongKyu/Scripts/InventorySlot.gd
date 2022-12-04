extends ItemSlot

onready var inventory_panel = get_parent().get_parent()
onready var desc_label = inventory_panel.get_node("DescriptionLabel")
onready var usage_buttons = inventory_panel.get_node("UsageButtons")


func _on_InventorySlot_gui_input(event):
	if not item_in_slot:
		return
	# left clicked,
	if event.is_action_pressed("left_click"):
		# show information of the item
		desc_label.text = item_in_slot.info["Description"] 
		usage_buttons.visible = false
	# right clicked,
	elif event.is_action_pressed("right_click"):
		# show buttons
		print("RIGHTCLICK")
		usage_buttons.rect_position = get_global_mouse_position() - inventory_panel.rect_position
		usage_buttons.visible = true
