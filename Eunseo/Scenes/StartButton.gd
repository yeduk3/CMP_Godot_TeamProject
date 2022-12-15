extends Button


func _on_StartButton_pressed():
	EndingManager.instance_monster()
	EndingManager.done_desk_spawn()
	EndingManager.drop_cacrd_key()
	
	PlayerItem._enter_tree()
	
	StatManager._ready()
	
	PlacedItem._enter_tree()
	
	get_tree().change_scene("res://Eunseo/Scenes/Prolog.tscn")
