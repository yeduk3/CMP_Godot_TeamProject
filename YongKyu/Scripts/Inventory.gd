extends ItemTable

signal put_ingredient(name, amount)

onready var item_buttons = $InventoryPanel/ItemButtons
onready var selected_item_index = -1

onready var study_note_panel = $InventoryPanel/StudyNotePanel


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
	
	print("Refresh")
	refresh_inventory()

#
# buttons
#

# on buttons
func _on_triggered_item_buttons(index):
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
		var item = PlayerItem.items[selected_item_index]
		var item_type = item.info["Type"]
		if item_type == "Cure":
			# decrease quantity
			add_item_quantity(selected_item_index, -1)
			# show result : used
			var player_ui = get_parent().get_parent()
			var item_name = item.info["Name"]
			if item_name == "Vision Cure":
				player_ui.get_node("VisionAbilityBar")._ability_up(1)
			elif item_name == "Hearing Cure":
				player_ui.get_node("HearingAbilityBar")._ability_up(1)
			elif item_name == "Smell Cure":
				player_ui.get_node("SmellAbilityBar")._ability_up(1)
		#elif item_type == "Ingredient" or item_type == "Weapon" or item_type == "Etc":
			# show result : nothing happened
		elif item_type == "Study Note":
			study_note_panel.get_node("TextLabel").text = ""
			var texts = PlayerItem.items[selected_item_index].info["Text"]
			for text in texts:
				study_note_panel.get_node("TextLabel").text += text + "\n"
			study_note_panel.visible = true
			
		
		
		item_buttons_off()

# click study note panel
func _on_StudyNotePanel_gui_input(event):
	if event.is_action_pressed("left_click"):
		study_note_panel.visible = false


# click make button
func _on_MakeButton_pressed(amount = 1, name = ""):
	var mode = get_parent().current_state
	if mode != "Making":
		item_buttons_off()
		return
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
func withdraw_item(name, amount):
	selected_item_index = PlayerItem.find_by_name(name)
	if selected_item_index == -1:
		selected_item_index = get_minimal_empty_index()
		print("Not Found. Substitute with : " + str(selected_item_index))
	_on_MakeButton_pressed(amount, name)
	
	item_buttons_off()

# make item
func _on_MakingTable_make_item(name):
	add_item(Item.get_new_item_data(name), 1)


func refresh_inventory():
	$InventoryPanel/HotBar.display_item_slots(size)
