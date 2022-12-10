extends SlotContainer

func _ready():
	#print("HotBar Ready")
	make_item_slots(control_node.size)
	yield(get_tree(), "idle_frame")
	display_item_slots(control_node.size)
	var panel = get_parent()
	rect_position.x = (panel.rect_size.x - rect_size.x) / 2
	rect_position.y = rect_position.x
