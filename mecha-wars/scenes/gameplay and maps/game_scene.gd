extends Node2D


@onready var can_place = false

@onready var starting_gold = 500
@onready var curr_gold

@onready var game_over = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$path_spawner/timer.start()
	curr_gold = starting_gold
	#$music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
