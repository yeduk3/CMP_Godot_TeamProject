extends Area2D

onready var health = $"../player/HealthBarTest/Health"


func _on_Health_item_body_entered(body):
	# 체력 회복
	# Thanks to 소웨18 융아치 + 엄씨
	health.current += 4
	queue_free()

