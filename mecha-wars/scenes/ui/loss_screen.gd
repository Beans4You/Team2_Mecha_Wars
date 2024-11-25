extends Control

#var start = preload("res://scenes/ui/start_screen.tscn")
var level_path = "res://scenes/gameplay_and_maps/game_scene.tscn"
@onready var game_scene = get_parent()


# Called when the node enters the scene tree for the first time.
func _ready():
	$game_over_sound.play()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass




func _on_restart_pressed() -> void:
	#game_scene.queue_free()
	var main = get_parent()
	print(level_path)
 	var level = load(level_path).instantiate()
	main.add_child(level)
	queue_free()
