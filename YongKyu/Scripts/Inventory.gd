extends Control

#############
# variables #
#############

onready var item_list = $Panel/ItemList
onready var description_label = $Panel/DescriptionLabel
onready var item_JSON_path = "res://YongKyu/Scripts/ItemData.JSON"
var item_data

###########
# methods #
###########

func _ready():
	loadItemJSON()

func _on_ItemList_item_selected(index):
	description_label.set_text("")
	var item_name = item_list.get_item_text(index)
	var item_description = item_data[item_name]["Description"]
	description_label.set_text(item_name + str("\n") + item_description)
	#print(item_description)
	


func loadItemJSON():
	var file = File.new()
	if not file.file_exists(item_JSON_path):
		print("Error on reading ItemData.JSON file. Please check.")
		get_tree().paused = true
		return
	file.open(item_JSON_path, File.READ)
	var JSON_parsed = JSON.parse(file.get_as_text())
	if typeof(JSON_parsed.result) != TYPE_DICTIONARY:
		print("Unexpected result on reading ItemData.JSON file. Please check.")
		print("Type of result is " + str(typeof(JSON_parsed.result)))
		get_tree().paused = true
		return
	file.close()
	item_data = JSON_parsed.result
