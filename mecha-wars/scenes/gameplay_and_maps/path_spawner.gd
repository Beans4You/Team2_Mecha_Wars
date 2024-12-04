extends Node2D
class_name path_spawner_parent_script

@onready var runner_path = preload("res://scenes/enemies/runner_path.tscn")
@onready var flyer_path = preload("res://scenes/enemies/flyer_path.tscn")
@onready var cthulhu_path = preload("res://scenes/enemies/cthulhu/cthulhu_path.tscn")
@onready var mother_path = preload("res://scenes/enemies/mothership/mothership_path.tscn")
@onready var game_scene = get_parent()
@onready var last_enemy_out = false
var enemy_array = [0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 2, 0, 1, 2, 1, 1, 0, 0, 0, 1, 1, 2, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 2, 1, 0, 0, 1, 2, 1, 0, 2, 1, 1, 2, 2, 1, 0, 1, 2, 2, 1, 1, 0, 1, 2,0,0, 1, 1, 0, 1, 2, 1, 1, 0, 2, 1, 0, 2, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 1, 2, 0, 1, 2, 0, 1, 1, 2, 0, 1, 2, 0, 2, 1, 1, 1, -10]
var array_spot = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _process(_delta):
	if game_scene.game_over == true or array_spot == len(enemy_array):
		$timer.stop()

	if game_scene.game_over == false and last_enemy_out and len(get_children()) == 1:
		game_scene.victory = true


func _on_timer_timeout() -> void:
	if (enemy_array[array_spot] == 1):
		var temp_path = runner_path.instantiate()
		add_child(temp_path)
	elif (enemy_array[array_spot] == 2):
		var temp_path = flyer_path.instantiate()
		add_child(temp_path)
	elif (enemy_array[array_spot] == 3):
		var temp_path = cthulhu_path.instantiate()
		add_child(temp_path)
	elif (enemy_array[array_spot] == 4):
		var temp_path = mother_path.instantiate()
		add_child(temp_path)
	elif(enemy_array[array_spot] == -10):
		last_enemy_out = true
		
	array_spot += 1
	
	if (array_spot % 10 == 0 and $timer.wait_time > 0.5):
		$timer.wait_time -= 0.15
