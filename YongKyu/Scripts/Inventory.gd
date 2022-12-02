extends Control

# receive it in SlotContainer
signal items_changed(indexes)

var cols = 6
var rows = 3
var slots = cols * rows


func _ready():
	# initial setting of player item list
	for i in range(slots):
		PlayerItem.items.append(null)
	
	add_item(Item.get_new_item_data("A"), 3)
	add_item(Item.get_new_item_data("B"), 3)
	add_item(Item.get_new_item_data("D"), 3)
	
	remove_item(1)
	
	add_item(Item.get_new_item_data("Vision Cure"), 2)

func add_item(item, amount):
	var minimal_empty_index = -1
	for i in slots:
		if not PlayerItem.items[i]:
			if minimal_empty_index == -1:
				minimal_empty_index = i
		elif PlayerItem.items[i].info["Name"] == item.info["Name"]:
			add_item_quantity(i, amount)
			return
	if minimal_empty_index > -1:
		set_item(minimal_empty_index, item)
		add_item_quantity(minimal_empty_index, amount)

# setting the new item
func set_item(index, item):
	var previous_item = PlayerItem.items[index]
	PlayerItem.items[index] = item
	emit_signal("items_changed", index)
	return previous_item

# remove the item
func remove_item(index):
	var previous_item = PlayerItem.items[index]
	PlayerItem.items[index] = null
	emit_signal("items_changed", index)
	return previous_item

# add only quantity of item
func add_item_quantity(index, amount):
	if not PlayerItem.items[index]:
		print("Error: No item to be added")
		return
	PlayerItem.items[index].quantity += amount
	if PlayerItem.items[index].quantity <= 0:
		remove_item(index)
	else:
		emit_signal("items_changed", index)
