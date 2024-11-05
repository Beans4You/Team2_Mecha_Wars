extends Node

@onready var can_place = false

@onready var starting_gold = 800
@onready var curr_gold = starting_gold

@onready var game_over = false


func _on_button_pressed() -> void:
	$tutorial_path/Timer.start() # Replace with function body.

func _physics_process(_delta: float) -> void:
	if game_over:
		tutorial_failed()
	

func tutorial_failed():
		
		var loss_screen_scene = load("res://scenes/ui/loss_screen.tscn")
		var loss_screen = loss_screen_scene.instantiate()
		loss_screen.level_path = "res://scenes/gameplay and maps/tutorial.tscn"
		get_parent().add_child(loss_screen)
		queue_free()
		
