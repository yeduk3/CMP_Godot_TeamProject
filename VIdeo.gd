extends Node2D

var stat = StatManager

func _ready():
	print(stat._get_stat2())
	if stat._get_stat2() >= 2:	# 60으로 맞출 것
		# hear 
		print("Set 3")
		$Dialog.use_Video3()
	else:
		print("Set 2")
		# cannot hear
		$Dialog.use_Video2()
	
# func _process(delta):
	
	
