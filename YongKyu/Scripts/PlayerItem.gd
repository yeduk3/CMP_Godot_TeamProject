extends Node

# items array that contains each item's data
# each data is Item.ItemData class
var items

func _enter_tree():
	print("PlayerItem Enter Tree")
	items = []
