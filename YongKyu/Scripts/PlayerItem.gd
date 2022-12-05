# Singleton
extends Node

# items array that contains each item's data
# each data is Item.ItemData class
var items

func _enter_tree():
	#print("PlayerItem Enter Tree")
	items = []

func find_by_name(name):
	for i in items.size():
		if items[i] and items[i].info["Name"] == name:
			return i
	return -1
