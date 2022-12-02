extends ItemSlot

func _on_InventorySlot_gui_input(event):
	if event.is_action_pressed("click"):
		# get desctription label
		var desc_label = get_parent().get_parent().get_node("DescriptionLabel")
		desc_label.text = item_in_slot.info["Description"]
