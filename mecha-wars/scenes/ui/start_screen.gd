extends Control

var main = preload("res://scenes/gameplay and maps/main.tscn")
var tutorial = preload("res://scenes/gameplay and maps/tutorial.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_tutorial_pressed() -> void:
	get_tree().change_scene_to_packed(tutorial)


func _on_button_start_pressed() -> void:
	get_tree().change_scene_to_packed(main)
