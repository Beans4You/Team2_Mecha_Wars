extends Node2D

'IMPORTANT: Call set_message() to change the text for the message'

func _ready() -> void:
	#for testing only
	"""
	$Total_Timer.wait_time = float(len($back/Label.text))/20.0 + 3.0
	$Total_Timer.start()
	"""
	pass

func _process(_delta: float) -> void:
	pass

func set_message(message):
	$back/Label.text += message
	$Total_Timer.wait_time = float(len($back/Label.text))/20.0 + 3.0
	$Total_Timer.start()


func _on_timer_timeout() -> void:
	$back/Label.visible_characters += 1
	if $back/Label.visible_characters == float(len($back/Label.text)):
		$Timer.queue_free()


func _on_total_timer_timeout() -> void:
	queue_free()
