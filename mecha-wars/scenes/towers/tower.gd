extends CharacterBody2D

class_name tower

var tower_range = Vector2(350, 350)


func _onready():
	$area.Size = tower_range
	$area.position = -1 * tower_range / 2
