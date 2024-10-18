extends Panel

@onready var tower_scene = preload("res://scenes/towers/rocket_dino/rocket_dino.tscn")
@onready var placement_check = preload("res://scenes/gameplay and maps/placement_check.tscn")
var currTile

func _on_gui_input(event):
	var tempTower = tower_scene.instantiate()
	var placement = placement_check.instantiate()

	
	if event is InputEventMouseButton and event.button_mask == 1:
		#Left Click Down
		add_child(tempTower)
		tempTower.get_node("area").show()
		
		add_child(placement)
		

		tempTower.process_mode = Node.PROCESS_MODE_DISABLED

	elif event is InputEventMouseMotion and event.button_mask == 1:
		#Left Click Drag
		get_child(2).global_position = event.global_position
		get_child(1).global_position = event.global_position
	#This is the "drop" action for the dino
	elif event is InputEventMouseButton and event.button_mask == 0:
		#Left Click Up
		#print("Left Button up")
		if global_vars.can_place == true:
			get_child(1).queue_free()
			var path = get_tree().get_root()
			path.add_child(tempTower)
			tempTower.global_position = event.global_position
			tempTower.get_node("area").hide()
		else:
			get_child(1).queue_free()
			get_child(2).queue_free()
	else:
		if get_child_count() > 1:
				get_child(1).queue_free()
