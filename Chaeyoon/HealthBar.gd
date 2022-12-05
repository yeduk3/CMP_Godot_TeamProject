extends Control

onready var health_bar = $HealthBar
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _on_Health_updated(health, amount):
	health_bar.value = health

func _on_max_helath_updated(max_health):
	health_bar.max_value = max_health
