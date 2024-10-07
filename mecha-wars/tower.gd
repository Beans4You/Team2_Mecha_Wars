extends CharacterBody2D
class_name tower

var range = Vector2(350, 350)


func _onready():
	$area.Size = range
	$area.position = -1 * range / 2
