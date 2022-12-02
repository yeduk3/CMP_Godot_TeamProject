extends ColorRect

onready var item_icon = $ItemIcon
onready var item_quantity = $ItemQuantity

# item should be Item.ItemData class
func set_item(item):
	if item and item is Item.ItemData:
		item_icon.texture = load(item.info["IconPath"])
		item_quantity.text = str(item.quantity)
	else:
		item_icon.texture = null
		item_quantity.text = ""
