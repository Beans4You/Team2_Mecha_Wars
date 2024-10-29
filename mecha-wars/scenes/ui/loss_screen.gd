extends Control

var start = preload("res://scenes/ui/start_screen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if global_vars.game_over == true:
		self.show()


func _on_restart_button_pressed():
	global_vars.restart_game.emit()
	get_tree().change_scene_to_file("res://scenes/ui/start_screen.tscn")
