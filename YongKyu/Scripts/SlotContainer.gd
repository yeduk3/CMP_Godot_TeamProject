extends GridContainer

# will be used in hotbar and making
class_name SlotContainer

export (PackedScene) var ItemSlot

var slots

# hotbar -> inventory
# making -> other?
onready var control_node = get_parent().get_parent()

func display_item_slots(cols, rows):
	columns = cols
	slots = cols * rows
	for index in range(slots):
		var item_slot = ItemSlot.instance()
		add_child(item_slot) 
		item_slot.set_item(null)
	control_node.connect("items_changed", self, "_on_Inventory_items_changed")

func _on_Inventory_items_changed(indexes):
	for index in indexes:
		if index < slots:
			var item_slot = get_child(index)
			var i = Item.get_item_data()
			item_slot.set_item(i)
