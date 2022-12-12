extends GridContainer

# will be used in HotBar.gd and MixBar.gd
class_name SlotContainer

export (PackedScene) var ItemSlot

var slots

# hotbar -> inventory
# making -> making table
onready var control_node = get_parent().get_parent()

func make_item_slots(size):
	slots = size.cols * size.rows
	for index in range(slots):
		# make the slot
		var item_slot = ItemSlot.instance()
		add_child(item_slot)
		
		# reset the slot
		item_slot.set_item(null)
		item_slot.set_index(index)
		
	# Inventory - HotBar / MakingTable - MixBar connection
	#print(self.name + " is connecting with " + control_node.name)
	control_node.connect("items_changed", self, "_on_items_changed")

func display_item_slots(size):
	columns = size.cols
	slots = size.cols * size.rows
	for index in range(slots):
		# get the slot
		_on_items_changed(index)

func _on_items_changed(index):
	#print(name + "Signal Received")
	if index < slots:
		var item_slot = get_child(index)
		item_slot.set_item(control_node.list_controlled[index])
