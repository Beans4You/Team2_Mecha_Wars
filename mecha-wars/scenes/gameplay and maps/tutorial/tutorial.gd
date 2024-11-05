extends Node

@onready var can_place = false

@onready var starting_gold = 800
@onready var curr_gold = starting_gold

@onready var game_over = false

@onready var main = preload("res://scenes/gameplay and maps/main.tscn")
@onready var win_message = preload("res://scenes/ui/message.tscn")


func _on_button_pressed() -> void:
	$tutorial_path/Timer.start() # Replace with function body.
	$Button.queue_free()

func _physics_process(_delta: float) -> void:
	if game_over:
		tutorial_failed()
	if $tutorial_path.get_child_count() == 0:
		tutorial_won()
		set_physics_process(false)
		
		
func tutorial_won():
	var win = win_message.instantiate()
	add_child(win)
	win.set_message("Now you know how to defend earth... \n\ngood luck soldier")
	var swap = main.instantiate()
	await get_child(win.get_index()).get_child(2).timeout
	get_parent().add_child(swap)
	queue_free()

func tutorial_failed():
		var loss_screen_scene = load("res://scenes/ui/loss_screen.tscn")
		var loss_screen = loss_screen_scene.instantiate()
		loss_screen.level_path = "res://scenes/gameplay and maps/tutorial.tscn"
		get_parent().add_child(loss_screen)
		queue_free()
		
