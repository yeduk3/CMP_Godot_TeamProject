extends StaticBody2D

export (Array) var get_item_list
export (int) var placed_index

signal gotIt(list)
signal get_item_from_map(list)


func _ready():
	var player = get_tree().current_scene.get_node("Player")
	self.connect("gotIt", player.get_node("Camera2D").get_node("Gotcha"), "_on_gotIt")
	self.connect("get_item_from_map", player.get_node("PlayerUI").get_node("IntegratedInventory"), "_on_get_item_from_map")
	$Area2D.connect("body_exited", self, "_on_Area2D_body_exited")
	
	if not PlacedItem.is_placed(placed_index):
		$light.visible = false
		$Button.visible = false

func _on_Area2D_body_entered(body):
	if body is Player && PlacedItem.is_placed(placed_index):
		$Button.visible = true
		
func _on_Area2D_body_exited(body):
	if body is Player:
		$Button.visible = false

func _on_Button_pressed():
	emit_signal("gotIt", get_item_list)
	emit_signal("get_item_from_map", get_item_list)
	$light.visible = false
	$Button.visible = false
	
	PlacedItem.unplace_by_index(placed_index)
