extends ColorRect

class_name ItemSlot

onready var item_icon = $ItemIcon
onready var item_quantity = $ItemQuantity
onready var control_node = get_parent().get_parent().get_parent()
var item_in_slot
var index

# item should be Item.ItemData class
func set_item(item):
	#print("Set item")
	if item and item is Item.ItemData:
		item_icon.texture = load(item.info["IconPath"])
		item_quantity.text = str(item.quantity)
		
		item_in_slot = item
	else:
		item_icon.texture = null
		item_quantity.text = ""
		
		item_in_slot = null

func set_index(_index):
	index = _index
