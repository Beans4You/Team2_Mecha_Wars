extends Node

@export var runner_scene : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_vars.connect("restart_game", game_start)
	$Path_Spawner/Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func game_start():
	global_vars.game_over = false
	$loss_screen.hide()
