extends Node

@export var runner_scene : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



#start button
func _on_button_pressed() -> void:
	pass
	#new_game()
	
func new_game():
	pass
	#$MobTimer.start()
	#$GameTimer.start()


func _on_mob_timer_timeout() -> void:
	pass
	var new_runner = runner_scene.instantiate()
	
	#needs code for setting runner location
	
	add_child(new_runner)


func _on_game_timer_timeout() -> void:
	pass
	#10 second timer, when it ends stop spawning enemies
	#$MobTimer.stop()
