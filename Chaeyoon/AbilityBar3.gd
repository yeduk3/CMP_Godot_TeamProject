extends ProgressBar

onready var player_stat_manager = get_node("/root/StatManager")

func _ready():
	var ability_bar3 = $"."
	ability_bar3.max_value = 100
	ability_bar3.min_value = 0
	ability_bar3.value = player_stat_manager._get_stat3()

func _ability_up(var value):
	var ability_bar3 = $"."
	ability_bar3.value = ability_bar3.value + value
	player_stat_manager._set_stat3(ability_bar3.value)
