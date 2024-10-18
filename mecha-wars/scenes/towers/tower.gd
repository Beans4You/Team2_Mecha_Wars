extends CharacterBody2D

class_name tower

var tower_range = Vector2(350, 350)
var gold_cost = 250
var paid_for = false


func _onready():
	$area.Size = tower_range
	$area.position = -1 * tower_range / 2

func pay_for():
	if global_vars.curr_gold >= gold_cost and paid_for == false:
		global_vars.curr_gold -= gold_cost
		self.paid_for = true
