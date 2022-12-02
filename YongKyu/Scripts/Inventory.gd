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
