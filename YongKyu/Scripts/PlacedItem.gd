extends Node

var list
var num_of_placed_items = 33

func _enter_tree():
	list = []
	for i in range(num_of_placed_items):
		list.push_back(true)

func unplace_by_index(placed_index):
	list[placed_index] = false

func is_placed(placed_index):
	return list[placed_index]
