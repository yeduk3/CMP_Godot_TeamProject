extends ProgressBar

onready var player_stat_manager = get_node("/root/StatManager")
onready var blur = $"../Blur"

func _ready():
	var ability_bar1 = $"."
	ability_bar1.max_value = 3
	ability_bar1.min_value = 0
	ability_bar1.value = player_stat_manager._get_stat1()
	
	set_blur()

func _ability_up(var value):
	var ability_bar1 = $"."
	ability_bar1.value = ability_bar1.value + value
	player_stat_manager._set_stat1(ability_bar1.value)
	
	set_blur()

# 아이템 먹으면 아래 코드 붙여넣기
# var test = $PlayerUI/AbilityBar1
# test._ability_up(10)

func set_blur():
	for child in blur.get_children():
		child.visible = false
	if value != max_value:
		blur.get_node("Blur" + str(value)).visible = true
