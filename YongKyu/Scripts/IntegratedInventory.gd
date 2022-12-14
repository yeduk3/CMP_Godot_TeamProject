extends Control

var states : Dictionary = {
	"PlayerInfo" : 0,
	"Making" : 1
}
var current_state

onready var inventory = $Inventory
onready var player_information = $PlayerInformation
onready var making_table = $MakingTable

func _ready():
	close()
	
	inventory.connect("put_ingredient", making_table, "_on_Inventory_put_ingredient")
	making_table.connect("make_item", inventory, "_on_MakingTable_make_item")

func open_with(mode):
	if states[mode] == 0:
		inventory.visible = true
		player_information.visible = true
		making_table.visible = false
		visible = true
	elif states[mode] == 1:
		inventory.visible = true
		player_information.visible = false
		making_table.visible = true
		visible = true
	else:
		print("Nonexist mode. Please check.")

func close():
	inventory.visible = false
	player_information.visible = false
	making_table.visible = false
	visible = false
	
	inventory.item_buttons_off()
	
	# withdraw if the state is making
	if current_state == "Making":
		for s in making_table.active_slots:
			var cur_item = making_table.making_items[s]
			if cur_item:
				inventory.withdraw_item(cur_item.info["Name"], -cur_item.quantity)
	
	# reset the description text in inventory
	inventory.get_node("InventoryPanel/DescriptionLabel").text = "Description"

func _input(event):
	if event.is_action_pressed("tab"):
		if visible:
			close()
		else:
			current_state = "PlayerInfo"
			open_with(current_state)

func _on_get_item_from_map(list):
	for item in list:
		inventory.add_item(Item.get_new_item_data(item), 1)
