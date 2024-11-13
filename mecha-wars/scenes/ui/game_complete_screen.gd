extends Control

var level_path = "res://scenes/ui/main_menu.tscn"
@onready var game_scene = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$victory_sound.play()



func _on_next_level_pressed() -> void:
	queue_free()
	var main = get_parent()
	var level = load(level_path).instantiate()
	main.add_child(level)
	main._ready() # reconnect nodes
