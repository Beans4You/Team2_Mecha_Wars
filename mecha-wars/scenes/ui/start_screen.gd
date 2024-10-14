extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	hide()
	var parent = get_parent()
	var timer = parent.get_node("Path_Spawner/Timer")
	timer.start()
	
