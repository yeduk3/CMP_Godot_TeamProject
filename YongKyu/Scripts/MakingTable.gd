extends Control

# receive it in SlotContainer
signal items_changed(indexes)

var cols = 3
var rows = 3
var slots = cols * rows

var making_items = []

func _ready():
	for i in range(slots):
		making_items.append(null)
	
