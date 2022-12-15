extends Node2D

var stat = StatManager

func _ready():
	if stat._get_stat2() >= 60:	# 60으로 맞출 것
		 $Dialog.use_Video3()
	else:
		$Dialog.use_Video2()
	
# func _process(delta):
	
	
