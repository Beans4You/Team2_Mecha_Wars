extends CanvasLayer
@onready var twr = get_parent()
var targeting_text = "◄ First►"

func _ready():
	$FlowContainer/targeting/Label.text = str(targeting_text)

func _on_targeting_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 0:
		if twr.targeting_mode == "first":
			twr.targeting_mode = "strong"
			targeting_text = "◄ Strong ►"
		elif twr.targeting_mode == "strong":
			twr.targeting_mode = "last"
			targeting_text = "◄ Last►"
		elif twr.targeting_mode == "last":
			twr.targeting_mode = "first"
			targeting_text = "◄ First►"
		else:
			print("targeting error")
			
		$FlowContainer/targeting/Label.text = targeting_text
		


func _on_damage_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 0:
		print("damage")


func _on_range_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 0:
		print("range")
