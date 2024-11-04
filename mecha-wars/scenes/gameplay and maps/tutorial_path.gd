extends Node2D



@onready var runner_path = preload("res://scenes/gameplay and maps/tutorial_enemy_path.tscn")
@onready var main = preload("res://scenes/gameplay and maps/main.tscn")
@onready var game_scene = get_parent()

var enemy_array = [1, 1, 1]
var array_spot = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _process(_delta):
	if array_spot == len(enemy_array):
		$Timer.stop()
		$Timer.queue_free()
		array_spot += 1
	if get_child_count() == 0:
		var swap = main.instantiate()
		get_parent().get_parent().add_child(swap)
		get_parent().queue_free()


func _on_timer_timeout() -> void:
	if (enemy_array[array_spot] == 1):
		var temp_path = runner_path.instantiate()
		add_child(temp_path)
	array_spot += 1
