extends GridContainer

# will be used in HotBar.gd and MixBar.gd
class_name SlotContainer

export (PackedScene) var ItemSlot

var slots

# hotbar -> inventory
# making -> making table
onready var control_node = get_parent().get_parent()

func display_item_slots(cols, rows):
	columns = cols
	slots = cols * rows
	for index in range(slots):
		var item_slot = ItemSlot.instance()
		add_child(item_slot) 
		item_slot.set_item(null)
		item_slot.set_index(index)
	
	# Inventory - HotBar / MakingTable - MixBar connection
	control_node.connect("items_changed", self, "_on_items_changed")
	#print(str(str(self), " and ", str(control_node), " connected"))

func _on_items_changed(index):
	#print(name + "Signal Received")
	if index < slots:
		var item_slot = get_child(index)
		item_slot.set_item(control_node.list_controlled[index])
