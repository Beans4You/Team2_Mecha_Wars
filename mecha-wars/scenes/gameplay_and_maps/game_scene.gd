extends Node2D
class_name game_scene_parent_script

@onready var placing_active = false

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
func _input(event):
	if event is InputEventMouseButton and event.button_mask == 0:
		#print("click in game scene")
		var towers = $tower_container.get_children()
		# loop thorugh towers and decide if ui should be on or off
		for t in towers:
			var local_mouse_pos = t.to_local(event.global_position)
			var clicked_tower_or_ui = shape_contains_point(t.get_node("character_collision_shape"), local_mouse_pos) or clicked_ui(event.global_position)
			if clicked_tower_or_ui and not placing_active:
				t.tower_ui_on()
			else:
				t.tower_ui_off()
			
# check if mouse click is in rectangle (uses local mouse position)
func shape_contains_point(collision_area, local_mouse_position):
	var extents = collision_area.shape.extents
	if abs(local_mouse_position.x) <= extents.x and abs(local_mouse_position.y) <= extents.y:
		return true
	else:
		return false

func clicked_ui(mouse_position):
	if mouse_position.x > 703:
		return true
	return false
	
			
