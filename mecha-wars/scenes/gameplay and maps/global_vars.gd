extends Node

var can_place = false

const starting_gold = 500
var curr_gold

var game_over = false

signal restart_game

func _ready() -> void:
	global_vars.connect("restart_game", start_game)
	start_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func start_game():
	curr_gold = starting_gold
