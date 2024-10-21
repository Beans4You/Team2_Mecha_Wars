extends Control

var main = preload("res://scenes/gameplay and maps/main.tscn")
var tutorial = preload("res://scenes/gameplay and maps/tutorial.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

<<<<<<< HEAD

func _on_button_tutorial_pressed() -> void:
	get_tree().change_scene_to_packed(tutorial)


func _on_button_start_pressed() -> void:
	get_tree().change_scene_to_packed(main)
=======
func _on_button_pressed() -> void:
	hide()
	var parent = get_parent()
	var timer = parent.get_node("Path_Spawner/Timer")
	timer.start()
	
 


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/gameplay and maps/tutorial.tscn") # Replace with function body.
>>>>>>> 50154af035eda5e7d2ef9097b61bf295a4d26683
