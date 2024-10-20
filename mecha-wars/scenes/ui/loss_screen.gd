extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if global_vars.game_over == true:
		self.show()


func _on_restart_button_pressed() -> void:
	global_vars.restart_game.emit() # Replace with function body.
