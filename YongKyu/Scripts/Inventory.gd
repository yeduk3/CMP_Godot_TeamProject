extends ItemTable

signal put_ingredient(name, amount)

onready var item_buttons = $InventoryPanel/ItemButtons
onready var selected_item_index = -1

func _enter_tree():
	#print("Inventory Enter Tree")
	# setting table
	set_table_size(6, 3)
	set_active_slots()
	set_list_controlled(PlayerItem.items)
	#print("Set")

func _ready():
	#print("Inventory Ready")
	
	item_buttons.add_constant_override("separation", 0)
	
	add_item(Item.get_new_item_data("A"), 3)
	add_item(Item.get_new_item_data("B"), 3)
	add_item(Item.get_new_item_data("D"), 3)
	add_item(Item.get_new_item_data("Vision Cure"), 2)
	
	set_item(5, Item.get_new_item_data("B"))
	set_item(12, Item.get_new_item_data("B"))
	set_item(17, Item.get_new_item_data("B"))
	

#
# buttons
#

# on buttons
func _on_triggered_item_buttons(index):
	print(str(get_global_mouse_position() - rect_global_position))
	item_buttons.rect_global_position = get_global_mouse_position()
	item_buttons.visible = true
	
	selected_item_index = index

# off buttons
func item_buttons_off():
	selected_item_index = -1
	
	item_buttons.visible = false

# click use button
func _on_UseButton_pressed():
	if selected_item_index >= 0:
		add_item_quantity(selected_item_index, -1)
		
		item_buttons_off()

# click make button
func _on_MakeButton_pressed(amount = 1, name = ""):
	if selected_item_index >= 0:
		if PlayerItem.items[selected_item_index]:
			if PlayerItem.items[selected_item_index].quantity > 0:
				emit_signal("put_ingredient", PlayerItem.items[selected_item_index].info["Name"], amount)
				add_item(PlayerItem.items[selected_item_index], -amount)
		else:
			add_item(Item.get_new_item_data(name), -amount)
			emit_signal("put_ingredient", PlayerItem.items[selected_item_index].info["Name"], amount)
		item_buttons_off()

# click cancel button
func _on_CancelButton_button_down():
	item_buttons_off()

# add item quantity from making table slot
func add_item_quantity_from_mts(name, amount):
	selected_item_index = PlayerItem.find_by_name(name)
	if selected_item_index == -1:
		selected_item_index = get_minimal_empty_index()
		print("Not Found. Substitute with : " + str(selected_item_index))
	_on_MakeButton_pressed(amount, name)
	
	item_buttons_off()
