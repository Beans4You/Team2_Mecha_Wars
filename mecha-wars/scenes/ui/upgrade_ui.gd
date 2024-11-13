extends CanvasLayer



func _on_targeting_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 0:
		print("targeting")


func _on_damage_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 0:
		print("damage")


func _on_range_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 0:
		print("range")
