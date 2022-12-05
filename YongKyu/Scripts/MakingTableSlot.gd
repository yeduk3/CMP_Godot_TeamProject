extends ItemSlot

onready var is_active = true

func _on_MakingSlot_gui_input(event):
	# if this slot is active and an item is in it,
	if not is_active:
		return
	if not item_in_slot:
		return
	# left click,
	if event.is_action_pressed("left_click"):
		print("Left")
		# increase item number
		# check whether the ingredient input is possible
		var index_in_player_item = PlayerItem.find_by_name(item_in_slot.info["Name"])
		if index_in_player_item == -1:
			return
		# if possible,
		var integrated_inventory = control_node.get_parent()
		integrated_inventory.inventory.add_item_quantity_from_mts(item_in_slot.info["Name"], 1)
	elif event.is_action_pressed("right_click"):
		print("Right")
		# decrease item number
		var integrated_inventory = control_node.get_parent()
		integrated_inventory.inventory.add_item_quantity_from_mts(item_in_slot.info["Name"], -1)
