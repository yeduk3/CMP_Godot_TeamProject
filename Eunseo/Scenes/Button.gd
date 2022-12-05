extends Button

func _ready():
	visible = false

func _on_player_button_draw():
	visible = true

func _on_player_button_hide():
	visible = false
