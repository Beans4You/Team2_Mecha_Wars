extends CharacterBody2D

class_name tower

var tower_range = Vector2(400, 400)
var gold_cost = 300


func _onready():
	$area.Size = tower_range
	$area.position = -1 * tower_range / 2

func _ready():
	pass
