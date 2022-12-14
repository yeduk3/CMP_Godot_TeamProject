extends StaticBody2D

export (Array) var get_item_list
export (int) var placed_index

signal gotIt(list)
signal get_item_from_map(list)

var isOpened = false

func _ready():
	var player = get_tree().current_scene.get_node("Player")
	self.connect("gotIt", player.get_node("Camera2D").get_node("Gotcha"), "_on_gotIt")
	self.connect("get_item_from_map", player.get_node("PlayerUI").get_node("IntegratedInventory"), "_on_get_item_from_map")

	if not PlacedItem.is_placed(placed_index):
		$light.visible = false
		$Unopen.visible = false
		$Open.visible = true
		$Button.visible = false
		
		already = true

func _on_Area2D_body_entered(body):
	if body is Player && isOpened == false:
		$Button.visible = true

func _on_Button_pressed():
	emit_signal("gotIt", get_item_list)
	emit_signal("get_item_from_map", get_item_list)
	$light.visible = false
	$Unopen.visible = false
	$Open.visible = true
	$Button.visible = false
	
	already = true
	
	PlacedItem.unplace_by_index(placed_index)
