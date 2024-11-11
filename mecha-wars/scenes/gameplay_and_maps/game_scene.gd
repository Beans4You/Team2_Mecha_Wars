extends Node2D
class_name game_scene_parent_script

@onready var can_place = false

@onready var starting_gold = 500
@onready var curr_gold

@onready var game_over = false

@onready var victory = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$path_spawner/timer.start() # modify in future for round system
	curr_gold = starting_gold
	#$music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if game_over == true:
		game_over_process()
	if victory == true:
		victory_process()

func game_over_process():
	# delete game scene and bring in loss screen to make a fresh one
	queue_free()
	var main_scene = get_parent()
	var loss_screen = load("res://scenes/ui/loss_screen.tscn").instantiate()
	
	main_scene.add_child(loss_screen)

func victory_process():
	queue_free()
	var main_scene = get_parent()
	var victory_screen = load("res://scenes/ui/victory_screen.tscn").instantiate()
	main_scene.add_child(victory_screen)
	
	
	
# showing area of towers
#func _input(event):
	#if event is InputEventMouseButton and event.button_mask == 0:
		#$area.show()
