extends Panel

@onready var tower = preload("res://scenes/mechas/rocket_dino_mecha.tscn")
var currTile

func _on_gui_input(event):
	var tempTower = tower.instantiate()
	
	if event is InputEventMouseButton and event.button_mask == 1:
		#Left Click Down
		add_child(tempTower)
		tempTower.get_node("Area").show()

		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
	elif event is InputEventMouseMotion and event.button_mask == 1:
		#Left Click Drag
		get_child(1).global_position = event.global_position
	elif event is InputEventMouseButton and event.button_mask == 0:
		#Left Click Up
		print("Left Button up")
		get_child(1).queue_free()
		
		var path = get_tree().get_root()
		path.add_child(tempTower)
		tempTower.global_position = event.global_position
		tempTower.get_node("Area").hide()
	else:
		if get_child_count() > 1:
				get_child(1).queue_free()