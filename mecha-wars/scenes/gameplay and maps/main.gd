extends Node

@export var runner_scene : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#global_vars.connect("restart_game", game_start)
	#$Path_Spawner/Timer.start()
	var start = $main_menu/m/vb/start #get_node("res://scenes/ui/main_menu/m/vb/start")
	start.pressed.connect(game_start) # check code
	
	var tutorial = $main_menu/m/vb/tutorial # get_node("res://scenes/ui/main_menu/m/vb/tutorial")
	tutorial.pressed.connect(play_tutorial)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func game_start():
	#global_vars.game_over = false
	#$loss_screen.hide()
	var game_scene_tree = load("res://scenes/gameplay and maps/game_scene.tscn").instantiate()
	add_child(game_scene_tree)
	$main_menu.queue_free()
	
func play_tutorial():
	var tutorial_scene = load("res://scenes/gameplay and maps/tutorial/tutorial.tscn").instantiate()
	add_child(tutorial_scene)
	$main_menu.queue_free()
	
