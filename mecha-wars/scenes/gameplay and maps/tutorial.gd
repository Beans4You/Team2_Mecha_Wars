extends Node

var runner = preload("res://scenes/enemies/runner/runner.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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
