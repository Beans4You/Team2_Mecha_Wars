extends Node2D

'IMPORTANT: Call set_message() to change the text for the message'

func _ready() -> void:
	#for testing only
	$Total_Timer.wait_time = len($back/Label.text)/20 + 3
	$Total_Timer.start()
	pass

func _process(delta: float) -> void:
	pass

func set_message(str):
	$back/Label.text += str
	$Total_Timer.wait_time = len($back/Label.text)/20 + 3
	$Total_Timer.start()


func _on_timer_timeout() -> void:
	$back/Label.visible_characters += 1
	if $back/Label.visible_characters == len($back/Label.text):
		$Timer.queue_free()


func _on_total_timer_timeout() -> void:
	queue_free()
