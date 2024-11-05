extends Node

@onready var can_place = false

@onready var starting_gold = 800
@onready var curr_gold = starting_gold

@onready var game_over = false


func _on_button_pressed() -> void:
	$tutorial_path/Timer.start() # Replace with function body.
