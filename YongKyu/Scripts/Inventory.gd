extends ItemTable

# in invectory.tscn, downside _enter_tree() execution and after upside _ready() execution

func _enter_tree():
	print("Inventory Enter Tree")
	# setting table
	set_table_size(6, 3)
	set_active_slots()
	set_list_controlled(PlayerItem.items)
	print("Set")

func _ready():
	print("Inventory Ready")
	add_item(Item.get_new_item_data("A"), 3)
	add_item(Item.get_new_item_data("B"), 3)
	add_item(Item.get_new_item_data("D"), 3)
	
	remove_item(1)
	
	add_item(Item.get_new_item_data("Vision Cure"), 2)
