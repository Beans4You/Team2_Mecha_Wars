extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area2D) -> void:
	global_vars.can_place = true
	print(global_vars.can_place)


func _on_area_exited(area: Area2D) -> void:
	global_vars.can_place = false
	print(global_vars.can_place)