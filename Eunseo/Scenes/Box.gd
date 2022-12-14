extends StaticBody2D

signal gotIt

var already = false

<<<<<<< Updated upstream
=======
func _ready():
	var player = get_tree().current_scene.get_node("Player")
	self.connect("gotIt", player.get_node("Camera2D").get_node("Gotcha"), "_on_gotIt")
	self.connect("get_item_from_map", player.get_node("PlayerUI").get_node("IntegratedInventory"), "_on_get_item_from_map")

>>>>>>> Stashed changes
func _on_Area2D_body_entered(body):
	if body is Player && already == false:
		$Button.visible = true

func _on_Area2D_body_exited(body):
	if body is Player:
		$Button.visible = false

func _on_Button_pressed():
	emit_signal("gotIt")
	$light.visible = false
	
	already = true
