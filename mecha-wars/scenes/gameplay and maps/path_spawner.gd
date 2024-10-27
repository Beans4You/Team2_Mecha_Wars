extends Node2D


@onready var path = preload("res://scenes/enemies/path.tscn")
var enemies_spawned = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(_delta):
	if global_vars.game_over == true:
		$Timer.stop()


func _on_timer_timeout() -> void:
	enemies_spawned += 1
	
	var temp_path = path.instantiate()
	add_child(temp_path)
	
	if (enemies_spawned == 5):
		$Timer.set_wait_time(1)
	elif (enemies_spawned == 10):
		$Timer.set_wait_time(0.5)
	elif (enemies_spawned == 20):
		$Timer.set_wait_time(0.25)
		#print(get_child(temp_path))
		#temp_path.get_node("runner").speed = 240
