extends Node

onready var player_stat_manager = get_node("/root/StatManager")

func _ready():
	var ability_bar2 = $"."
	ability_bar2.max_value = 100
	ability_bar2.min_value = 0
	ability_bar2.value = player_stat_manager._get_stat2()

func _ability_up(var value):
	var ability_bar2 = $"."
	ability_bar2.value = ability_bar2.value + value
	player_stat_manager._set_stat2(ability_bar2.value)
