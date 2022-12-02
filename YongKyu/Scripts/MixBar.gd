extends SlotContainer

func _ready():
	display_item_slots(control_node.cols, control_node.rows)
	# invisible except of triangles
	for i in slots:
		if i != 1 and i != 6 and i != 8:
			var space_node = get_child(i)
			space_node.color.a = 0
			space_node.is_active = false

	# position setting
	yield(get_tree(), "idle_frame")
	var panel = get_parent()
	rect_position.x = (panel.rect_size.x - rect_size.x) / 2
	rect_position.y = (panel.rect_size.y - rect_size.y) / 2
