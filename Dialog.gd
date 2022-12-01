extends Polygon2D

onready var Text = get_parent().get_node("Text")
var finished = false




func _on_Text_hide():
	queue_free()
