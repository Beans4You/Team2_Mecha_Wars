extends Node

@export var runner_scene : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_vars.connect("restart_game", game_start)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $"Start Screen".visible == false:
		$UI.show()


func game_start():
	global_vars.game_over = false
	$"Start Screen".show()
	$loss_screen.hide()
