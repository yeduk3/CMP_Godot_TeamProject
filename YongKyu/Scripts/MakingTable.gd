extends ItemTable

var making_items

onready var mix_bar = $Panel/MixBar
onready var texture_button = $Panel/MakingButton

func _enter_tree():
	#print("MakingTable Enter Tree")
	set_table_size(3, 3)
	set_active_slots([1, 6, 8])
	making_items = []
	set_list_controlled(making_items)

func _on_put_ingredient(name, amount):
	add_item(Item.get_new_item_data(name), amount)
	
	# check whether the making process is possible
	var number_of_ingredients = 0
	for e in making_items:
		if e:
			number_of_ingredients += e.quantity
	if number_of_ingredients > 1:
		texture_button.visible = true
	else:
		texture_button.visible = false


func _on_MakingButton_pressed():
	pass
