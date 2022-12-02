extends SlotContainer

func _ready():
	print("HotBar Ready")
	display_item_slots(control_node.cols, control_node.rows)
	yield(get_tree(), "idle_frame")
	var panel = get_parent()
	rect_position.x = (panel.rect_size.x - rect_size.x) / 2
	rect_position.y = rect_position.x
