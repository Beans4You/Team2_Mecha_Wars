extends Control

var start = preload("res://scenes/ui/start_screen.tscn")
var level_path = "res://scenes/gameplay and maps/game_scene.tscn"
@onready var game_scene = get_parent()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass




func _on_restart_pressed() -> void:
	var main = get_parent()
	var level = load(level_path).instantiate()
	main.add_child(level)
	queue_free()
