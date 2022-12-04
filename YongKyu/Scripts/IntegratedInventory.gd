extends Control

var states : Dictionary

onready var inventory = $Inventory
onready var player_information = $PlayerInformation
onready var making_table = $MakingTable

func _ready():
	states = {
		"PlayerInfo" : 0,
		"Making" : 1
	}
	close()
	
	inventory.connect("ingredient_of_making", self, "_on_put_ingredient")

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

func _input(event):
	if event.is_action_pressed("tab"):
		if visible:
			close()
		else:
			open_with("Making")


func _on_put_ingredient(name):
	making_table.add_item(Item.get_new_item_data(name), 1)
