extends game_scene_parent_script

func _ready() -> void:
	$path_spawner_level_3/timer.start()
	curr_gold = starting_gold
	$music.play()
	


func game_over_process():
	# delete game scene and bring in loss screen to make a fresh one
	queue_free()
	var main_scene = get_parent()
	var loss_screen = load("res://scenes/ui/loss_screen.tscn").instantiate()
	loss_screen.level_path = "res://scenes/gameplay and maps/game_scene_level_3.tscn"
	main_scene.add_child(loss_screen)
#
func victory_process():
	queue_free()
	var main_scene = get_parent()
	var game_complete_screen = load("res://scenes/ui/game_complete_screen.tscn").instantiate()
	main_scene.add_child(game_complete_screen) 
