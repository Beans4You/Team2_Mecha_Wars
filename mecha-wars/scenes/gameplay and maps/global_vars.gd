extends Node

var can_place = false

const starting_gold = 500
var curr_gold

var game_over = false

signal restart_game
signal show_next

var tutorial = true

func _ready() -> void:
	global_vars.connect("restart_game", start_game)
	start_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func start_game():
	curr_gold = starting_gold
	
func show_next_box():
	if tutorial:
		show_next.emit()
		tutorial = false
