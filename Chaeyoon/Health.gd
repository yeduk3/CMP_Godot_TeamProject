extends Node

# signal max_changed(new_max)
# signal changed(new_amount)
# signal depleted

# export(int) var max_amount = 10 setget set_max
# onready var current = max_amount setget set_current
onready var player_stat_manager = get_node("/root/StatManager")

func _ready():
	_initialize()

func set_max(new_max):
	# max_amount = new_max
	# max_amount = max(1, new_max)
	# emit_signal("max_changed", max_amount)
	pass
	
func set_current(new_value):
	# current = new_value
	# current = clamp(current, 0, max_amount)
	# emit_signal("changed", current)
	
	# if current == 0:
	# 	emit_signal("depleted")
	pass

func _initialize():
	# emit_signal("max_changed", max_amount)
	# emit_signal("changed", current)
	var health_bar = $"../../HealthBarTest/HealthBar"
	health_bar.max_value = 100
	health_bar.min_value = 0
	health_bar.value = player_stat_manager._get_health()
	#작명센스가 아주 좋으세요 ^^
# func _health_up():
# 	pass

func _health_down(var value):
	var health_bar = $"../../HealthBarTest/HealthBar"
	health_bar.value = health_bar.value - value
	player_stat_manager._set_health(health_bar.value)
	
	if health_bar.value <= 0:
		#get_tree().paused = true
		$"../../GameOver".visible = true
		
		#yield(get_tree().create_timer(3.0), "timeout")
		get_tree().change_scene("res://Eunseo/Scenes/Ending2Bad.tscn")

