extends Node

# JSON file
onready var item_JSON_path = "res://YongKyu/Scripts/ItemData.JSON"
var list

# class to manage item data in script and include quantity
class ItemData:
	var info
	var quantity
	
	func _init(_quantity = 0):
		quantity = _quantity

###########
# methods #
###########

func _ready():
	print("Item Ready")
	list = loadItemJSON()
	if list == null:
		get_tree().paused = true

func loadItemJSON():
	var file = File.new()
	if not file.file_exists(item_JSON_path):
		print("Error on reading ItemData.JSON file. Please check.")
		return null
	file.open(item_JSON_path, File.READ)
	var JSON_parsed = JSON.parse(file.get_as_text())
	if typeof(JSON_parsed.result) != TYPE_DICTIONARY:
		print("Unexpected result on reading ItemData.JSON file. Please check.")
		print("Type of result is " + str(typeof(JSON_parsed.result)))
		return null
	file.close()
	return JSON_parsed.result

# initial item data
func get_new_item_data(name):
	if not name.empty():
		var in_list = list.get(name)
		if in_list:
			var item_data = ItemData.new(0)
			item_data.info = in_list
			#print(str("get a new item : ", item_data.info["Name"]))
			return item_data
	print("No Item")

