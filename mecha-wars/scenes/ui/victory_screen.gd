extends Control

var level_path = "res://scenes/gameplay and maps/game_scene_level_2.tscn"
@onready var game_scene = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$victory_sound.play()
	


	


func _on_next_level_pressed() -> void:
	game_scene.queue_free()
	var main = get_parent().get_parent()
	var level = load(level_path).instantiate()
	main.add_child(level)
	queue_free()
