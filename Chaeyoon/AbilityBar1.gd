extends Node

onready var player_stat_manager = get_node("/root/StatManager")

func _ready():
	var ability_bar1 = $"."
	ability_bar1.max_value = 100
	ability_bar1.min_value = 0
	ability_bar1.value = player_stat_manager._get_stat1()

func _ability_up(var value):
	var ability_bar1 = $"."
	ability_bar1.value = ability_bar1.value + value
	player_stat_manager._set_stat1(ability_bar1.value)

# 아이템 먹으면 아래 코드 붙여넣기
# var test = $PlayerUI/AbilityBar1
# test._ability_up(10)
