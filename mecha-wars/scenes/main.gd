extends Node

@export var runner_scene : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



#start button
func _on_button_pressed() -> void:
	new_game()
	
func new_game():
	$MobTimer.start()
	$GameTimer.start()


func _on_mob_timer_timeout() -> void:
	var new_runner = runner_scene.instantiate()
	
	#needs code for setting runner location
	
	add_child(new_runner)


func _on_game_timer_timeout() -> void:
	#10 second timer, when it ends stop spawning enemies
	$MobTimer.stop()
