extends SlotContainer

func _ready():
	#print("MixBar Ready")
	make_item_slots(control_node.size)
	yield(get_tree(), "idle_frame")
	display_item_slots(control_node.size)
	# invisible except of triangles
	for i in slots:
		if i != 1 and i != 6 and i != 8:
			var space_node = get_child(i)
			space_node.color.a = 0
			space_node.is_active = false

	# position setting
	"""
	var panel = get_parent()
	rect_position.x = (panel.rect_size.x - rect_size.x)/2
	rect_position.y = (panel.rect_size.y - rect_size.y) / 2
	# calculation is weird when the making table is invisible
	print(panel.get_parent().name)
	print(str(panel.rect_size.x, " - ", rect_size.x, " = 2 * ", (panel.rect_size.x - rect_size.x)/2))
	print(rect_position.x)
	print(str(panel.rect_size.y, " - ", rect_size.y, " = 2 * ", rect_position.y))
	"""
