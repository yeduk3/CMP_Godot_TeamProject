extends ItemSlot

signal triggered_item_buttons(index)

onready var inventory_panel_node = get_parent().get_parent()
onready var desc_label = inventory_panel_node.get_node("DescriptionLabel")
onready var item_buttons = inventory_panel_node.get_node("ItemButtons")

func _ready():
	self.connect("triggered_item_buttons", control_node, "_on_triggered_item_buttons")

func _on_InventorySlot_gui_input(event):
	if not item_in_slot:
		return
	# left clicked,
	if event.is_action_pressed("left_click"):
		# show information of the item
		desc_label.text = item_in_slot.info["Description"] 
		item_buttons.visible = false
	# right clicked,
	elif event.is_action_pressed("right_click"):
		# show buttons
		emit_signal("triggered_item_buttons", index)
