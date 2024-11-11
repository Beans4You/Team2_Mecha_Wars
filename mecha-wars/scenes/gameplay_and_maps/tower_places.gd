extends Area2D
@onready var game_scene = get_parent().get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_entered(_area: Area2D) -> void:
	game_scene.can_place = true


func _on_area_exited(_area: Area2D) -> void:
	game_scene.can_place = false
