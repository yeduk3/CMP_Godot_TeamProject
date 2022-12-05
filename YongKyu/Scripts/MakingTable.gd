extends ItemTable

var making_items

onready var mix_bar = $Panel/MixBar

func _enter_tree():
	#print("MakingTable Enter Tree")
	set_table_size(3, 3)
	set_active_slots([1, 6, 8])
	making_items = []
	set_list_controlled(making_items)

func _ready():
	
	#print("MakingTable Ready")
	
	"""
	add_item(Item.get_new_item_data("A"), 3)
	add_item(Item.get_new_item_data("Hearing Cure"), 3)
	add_item(Item.get_new_item_data("F"), 3)
	
	remove_item(1)
	
	add_item(Item.get_new_item_data("Vision Cure"), 2)
	"""

func _on_put_ingredient(name, amount):
	add_item(Item.get_new_item_data(name), amount)
	print(str(making_items))
