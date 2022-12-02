extends Control

signal items_changed(indexes)

var cols = 6
var rows = 3
var slots = cols * rows

# items array that contains each item's data
# each data is Item.ItemData class
var items = []

func _ready():
	for i in range(slots):
		items.append(null)
	
	set_item(1, )

func set_item(index, item):
	var previous_item = items[index]
	items[index] = item
	emit_signal("items_changed", [index])
	return previous_item

func remove_item(index):
	var previous_item = items[index].duplicate()
	items[index].clear()
	emit_signal("items_changed", [index])
	return previous_item

func add_item_quantity(index, amount):
	items[index].quantity += amount
	if items[index].quantity <= 0:
		remove_item(index)
	else:
		emit_signal("items_changed", [index])
