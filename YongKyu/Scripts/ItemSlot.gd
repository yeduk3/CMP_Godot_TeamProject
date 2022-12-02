extends ColorRect

class_name ItemSlot

onready var item_icon = $ItemIcon
onready var item_quantity = $ItemQuantity
var item_in_slot

# item should be Item.ItemData class
func set_item(item):
	if item and item is Item.ItemData:
		var icon = load(item.info["IconPath"])
		if not icon:
			icon = load("res://icon.png")
		item_icon.texture = icon
		item_quantity.text = str(item.quantity)
		
		item_in_slot = item
	else:
		item_icon.texture = null
		item_quantity.text = ""
