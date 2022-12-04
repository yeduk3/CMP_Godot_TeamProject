extends ItemTable

signal ingredient_of_making(name)

onready var item_buttons = $InventoryPanel/ItemButtons
var selected_item_index

func _enter_tree():
	print("Inventory Enter Tree")
	# setting table
	set_table_size(6, 3)
	set_active_slots()
	set_list_controlled(PlayerItem.items)
	print("Set")

func _ready():
	print("Inventory Ready")
	
	item_buttons.add_constant_override("separation", 0)
	
	add_item(Item.get_new_item_data("A"), 3)
	add_item(Item.get_new_item_data("B"), 3)
	add_item(Item.get_new_item_data("D"), 3)
	add_item(Item.get_new_item_data("Vision Cure"), 2)

#
# buttons
#

# on buttons
func _on_triggered_item_buttons(index):
	item_buttons.rect_position = get_global_mouse_position() - rect_position
	item_buttons.visible = true
	
	selected_item_index = index

# off buttons
func item_buttons_off():
	item_buttons.visible = false

# click use button
func _on_UseButton_pressed():
	add_item_quantity(selected_item_index, -1)
	
	item_buttons_off()

# click make button
func _on_MakeButton_pressed():
	emit_signal("ingredient_of_making", PlayerItem.items[selected_item_index].info["Name"])
	add_item_quantity(selected_item_index, -1)
	
	item_buttons_off()

# click cancel button
func _on_CancelButton_button_down():
	item_buttons_off()
