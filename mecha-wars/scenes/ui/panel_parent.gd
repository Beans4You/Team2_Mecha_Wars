extends Panel
class_name panel_parent_script

@onready var tower_scene = preload("res://scenes/towers/rocket_dino/rocket_dino.tscn")
#@onready var placement_check = preload("res://scenes/gameplay and maps/placement_check.tscn")
@onready var game_scene = get_parent().get_parent().get_parent().get_parent()
#@onready var tile_overlap = preload("res")

var currTile
var tile_size = 32 * 3
var placing_active = false

func _on_gui_input(event):
	var tempTower = tower_scene.instantiate()
	
	if game_scene.curr_gold >= tempTower.gold_cost:
		#var placement = placement_check.instantiate()
		
		if event is InputEventMouseButton and event.button_mask == 1:
			#Left Click Down
			#global_vars.show_next_box()
			add_child(tempTower)
			tempTower.get_node("area").show()
			
			#add_child(placement)
			
			tempTower.process_mode = Node.PROCESS_MODE_DISABLED
			placing_active = true

		elif placing_active and event is InputEventMouseMotion and event.button_mask == 1:
			##Left Click Drag
			get_child(1).global_position = event.global_position
			#get_child(2).global_position = event.global_position

		
		#This is the "drop" action for the dino
		elif placing_active and event is InputEventMouseButton and event.button_mask == 0:
			#Left Click Up
			#print("Left Button up")
			if true: #game_scene.can_place == true:
				get_child(1).queue_free()
				var path = get_tree().get_root()
				path.add_child(tempTower)
				tempTower.global_position = event.global_position.snapped(Vector2(tile_size, tile_size))
				""" here we can fix the grid snapping by adjusting the position"""
				"need to add a visual cue showing you the tile"
				tempTower.get_node("area").hide()
				game_scene.curr_gold -= tempTower.gold_cost
				placing_active = false
			else:
				get_child(1).queue_free()
				#get_child(2).queue_free()
		else:
			if get_child_count() > 1:
					get_child(1).queue_free()
		
	
