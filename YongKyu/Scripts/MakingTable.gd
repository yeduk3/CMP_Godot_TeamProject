extends ItemTable

signal make_item(name)

var making_items

onready var mix_bar = $Panel/MakingBar
onready var making_button = $Panel/MakingButton

func _enter_tree():
	#print("MakingTable Enter Tree")
	set_table_size(3, 3)
	set_active_slots([1, 6, 8])
	making_items = []
	set_list_controlled(making_items)

func _on_Inventory_put_ingredient(name, amount):
	add_item(Item.get_new_item_data(name), amount)
	
	# check whether the making process is possible
	var number_of_ingredients = 0
	for e in making_items:
		if e:
			number_of_ingredients += e.quantity
	if number_of_ingredients > 1:
		making_button.visible = true
	else:
		making_button.visible = false


func _on_MakingButton_pressed():
	# button invisible
	making_button.visible = false
	
	# find items which have the item list in
	var found = false
	var result = ""
	# for all items in database
	for item_name_key in Item.list:
		# if the item is not makable, skip it
		if not Item.list[item_name_key].has("Ingredients"):
			found = false
			continue
		
		var ingredients = Item.list[item_name_key]["Ingredients"].duplicate()
		# for all items in active slots
		for s in active_slots:
			var cur_item = making_items[s]
			# if there's no item in slot, continue it
			if not cur_item:
				continue
			# if the item needs what player put into slots and the item's quantity is same with condition
			if ingredients.has(cur_item.info["Name"]) and ingredients[cur_item.info["Name"]] == cur_item.quantity:
					result = item_name_key
					ingredients.erase(cur_item.info["Name"])
					found = true
			# wrong item input or wrong item's quantity input
			else:
				found = false
				break
		# if found all the item,
		if found and ingredients.empty():
			break
		# else, continue the loop
		else:
			result = ""
	# end loop
	
	for s in active_slots:
		set_item(s, null)
	# if exist,
	if found:
		# get it
		print(result)
		emit_signal("make_item", result)
	# else (nonexist)
	else:
		# get failure
		print("no such item")
		emit_signal("make_item", "Failure Thing")
