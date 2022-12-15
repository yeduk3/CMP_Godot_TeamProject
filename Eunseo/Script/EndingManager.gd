extends Node

var monster_exist = true
var desk_position = Vector2(4162, 556)
var desk_spawn = false
var card_key = false

var studynote5 = false

func destroy_monster():
	monster_exist = false

func is_monster_exist():
	return monster_exist

func set_desk_spawn():
	desk_spawn = true

func done_desk_spawn():
	desk_spawn = false

func is_desk_spawn():
	return desk_spawn

func get_desk_position():
	return desk_position
	
func set_card_key():
	card_key = true
	
func has_card_key():
	return card_key

func set_studynote5():
	studynote5 = true

func has_studynote5():
	return studynote5
