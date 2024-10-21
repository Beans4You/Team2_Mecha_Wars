extends Node

var runner = preload("res://scenes/enemies/runner/runner.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_vars.connect("show_next", show_placement)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func show_placement():
	$tower_places.show()
	$tower_message.hide()

var count = 0

func _on_button_pressed() -> void:
	if count == 0:
		$Button.text = "Click to 
		Spawn an Alien"
		count += 1
	else:
		var runner_1 = runner.instantiate()
		$Path2D/PathFollow2D.add_child(runner_1)
		$Button.queue_free()


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/start_screen.tscn") # Replace with function body.
