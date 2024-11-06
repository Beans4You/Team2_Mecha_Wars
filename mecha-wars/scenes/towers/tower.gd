extends CharacterBody2D

class_name tower

var tower_range = 400
var gold_cost = 300


func _ready():
	#print("hello")
	$area.size = Vector2(tower_range, tower_range)
	$area.position = -1 * Vector2(tower_range, tower_range) / 2
	$range/range_collision_shape.shape.radius = float(tower_range) / 2
	#$range.position = -1 * Vector2(tower_range, tower_range) / 2
	$animated_sprite.play("idle")
