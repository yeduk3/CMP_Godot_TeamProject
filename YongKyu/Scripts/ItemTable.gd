extends Control

# inventory.gd and makingtable.gd
class_name ItemTable

# receive it in SlotContainer
signal items_changed(indexes)

var cols
var rows
var slots
var active_slots
var list_controlled

#
# setting for table, executed in child class
#
func set_table_size(_cols, _rows):
	cols = _cols
	rows = _rows
	slots = cols * rows
	
func set_active_slots(_active_slots = slots):
	active_slots = _active_slots

func set_list_controlled(_list_controlled):
	list_controlled = _list_controlled

#
# ready
#

func _ready():
	print("ItemTable Ready")
	# initial setting of player item list
	for i in range(slots):
		list_controlled.append(null)

#
# manage list_controlled
#

# find a proper place and add the item in it
func add_item(item, amount):
	var minimal_empty_index = -1
	for i in active_slots:
		if not list_controlled[i]:
			if minimal_empty_index == -1:
				minimal_empty_index = i
		elif list_controlled[i].info["Name"] == item.info["Name"]:
			add_item_quantity(i, amount)
			return
	if minimal_empty_index > -1:
		print(minimal_empty_index)
		set_item(minimal_empty_index, item)
		add_item_quantity(minimal_empty_index, amount)

# setting the new item
func set_item(index, item):
	var previous_item = list_controlled[index]
	list_controlled[index] = item
	emit_signal("items_changed", index)
	print("Signal Emmited")
	return previous_item

# remove the item
func remove_item(index):
	var previous_item = list_controlled[index]
	list_controlled[index] = null
	emit_signal("items_changed", index)
	return previous_item

# add only quantity of item
func add_item_quantity(index, amount):
	if not list_controlled[index]:
		print("Error: No item to be added")
		return
	list_controlled[index].quantity += amount
	if list_controlled[index].quantity <= 0:
		remove_item(index)
	else:
		emit_signal("items_changed", index)
