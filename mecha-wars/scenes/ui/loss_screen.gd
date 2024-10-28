extends Control

var start = preload("res://scenes/ui/start_screen.tscn")
@onready var game_scene = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if game_scene.game_over == true:
		self.show()


func _on_restart_button_pressed():
	game_scene.restart_game.emit()
	get_tree().change_scene_to_file("res://scenes/ui/start_screen.tscn")
