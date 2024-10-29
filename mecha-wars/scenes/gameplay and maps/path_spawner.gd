extends Node2D


@onready var path = preload("res://scenes/enemies/path.tscn")
@onready var game_scene = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(_delta):
	if game_scene.game_over == true:
		$timer.stop()


func _on_timer_timeout() -> void:
	var temp_path = path.instantiate()
	add_child(temp_path)
