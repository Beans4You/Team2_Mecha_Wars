extends Panel
class_name panel_parent_script

@onready var tower_scene = load("res://scenes/towers/rocket_dino/rocket_dino.tscn")
#@onready var placement_check = preload("res://scenes/gameplay and maps/placement_check.tscn")
@onready var game_scene = get_parent().get_parent().get_parent().get_parent()
#@onready var tile_overlap = preload("res")

@onready var map_root_node = game_scene.get_child(0)

var currTile
var tile_size = 32 
#var placing_active = false
var tempTower
var gold_check_tower

func _ready():
	#gold check so that temp tower isn't created every instant of gui input
	gold_check_tower = tower_scene.instantiate()
	gold_check_tower._ready()

func _on_gui_input(event):
	if game_scene.curr_gold >= gold_check_tower.gold_cost:
		if event is InputEventMouseButton and event.button_mask == 1:
			tempTower = tower_scene.instantiate()
			tempTower._ready() # may need to switch to ._init at some point
			#Left Click Down
			game_scene.get_node("tower_container").add_child(tempTower)
			tempTower.get_node("area").show()
			tempTower.position = event.global_position
			
			# prevent shooting stuff
			tempTower.process_mode = Node.PROCESS_MODE_DISABLED
			game_scene.placing_active = true

		elif game_scene.placing_active and event is InputEventMouseMotion and event.button_mask == 1:
			##Left Click Drag
			tempTower.global_position = event.global_position
			var character_shape = tempTower.get_node("character_collision_shape").shape
			var not_on_path = loop_through_capsule_area_and_check_for_path_collision(character_shape.extents.x, character_shape.extents.y, event.global_position)
			if not not_on_path:
				# make red
				tempTower.get_node("area").modulate = Color(255,0,0, 0.3)
				tempTower.get_node("area").show()
			else:
				# switch back to grey
				tempTower.get_node("area").modulate = Color(0, 0, 0, 0.3137)

		#This is the "drop" action for the dino
		elif game_scene.placing_active and event is InputEventMouseButton and event.button_mask == 0:
			#Left Click Up
			# checking if the place put down is on the path
			var character_shape = tempTower.get_node("character_collision_shape").shape
			var not_on_path = loop_through_capsule_area_and_check_for_path_collision(character_shape.extents.x, character_shape.extents.y, event.global_position)

			# here we check that the tower isn't in the ui section, and is not in the path layer
			if event.global_position.x < 1280 and not_on_path and event.global_position.x > 0 and event.global_position.y > 5 and event.global_position.y < 700: 
				# grid snap
				tempTower.global_position = event.global_position.snapped(Vector2(tile_size, tile_size))
				tempTower.get_node("area").hide()
				game_scene.curr_gold -= tempTower.gold_cost
				game_scene.placing_active = false
				# re enable shooting
				tempTower.process_mode = Node.PROCESS_MODE_INHERIT
			else:
				# remove potential tower
				game_scene.get_node("tower_container").remove_child(tempTower)
				tempTower.queue_free()

		#else:
			#print("error in panel parent processing gui input")
			##if get_child_count() > 1:
					##get_child(1).queue_free()
		

# loops through every point in the characters area and checks if the point overlaps with path
func loop_through_capsule_area_and_check_for_path_collision(area_width, area_height, mouse_position):
	var no_path_collision = true
	var path_layer = map_root_node.get_child(2)
	for x in range(-int(area_width), int(area_width)):
		for y in range(-int(area_height), int(area_height)):
			var point = Vector2(x, y)
			var cell_coords = path_layer.local_to_map(mouse_position + point)
			no_path_collision = no_path_collision and path_layer.get_cell_tile_data(cell_coords) == null
	
			
	return no_path_collision

	# might be able to use round shapes if you switch this code to collision_shape.shape.contains_point(event.global_position)
	# might not work with the path logic however
