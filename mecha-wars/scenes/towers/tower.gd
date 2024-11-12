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
	$area.mouse_filter = Control.MOUSE_FILTER_IGNORE # makes area node unclickable for handling clicking input


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if  event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		toggle_tower_ui()
		

func toggle_tower_ui():
	$area.visible = !$area.visible
	# also need to make it where if another tower or any non tower gets clicked it hides all tower uis
	
	
# might need to use unhandled input to manage clicking within same range
#func _unhandled_input(event:InputEvent):
	#print("unhandled input")
