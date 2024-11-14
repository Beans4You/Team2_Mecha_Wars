extends CanvasLayer
@onready var twr = get_parent()
var targeting_text = "◄ First►"
var upgrade_panel_color = Color(0.08, 0.3, 0.6, 1)
var damage_upgrade_counter = 0
var range_upgrade_counter = 0
@onready var game_scene = get_parent().get_parent().get_parent()

func _ready():
	$FlowContainer/targeting/Label.text = str(targeting_text)
	$FlowContainer/damage.modulate = upgrade_panel_color
	$FlowContainer/range.modulate = upgrade_panel_color

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
		if damage_upgrade_counter == 0 and game_scene.curr_gold >= 150:
			twr.damage = twr.damage * 2
			damage_upgrade_counter += 1
			$FlowContainer/damage/Label.text = "Max Damage"
			game_scene.curr_gold -= 150
		else:
			pass
			#$FlowContainer/damage/Label.text = "Max Damage"
		#print(twr.damage)


func _on_range_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 0:
		if range_upgrade_counter == 0 and game_scene.curr_gold >= 100:
			twr.tower_range = twr.tower_range * 1.25
			twr.update_range()
			range_upgrade_counter += 1
			$FlowContainer/range/Label.text = "Max Range"
			game_scene.curr_gold -= 100
		else:
			pass 
			#$FlowContainer/range/Label.text = "Max Range"
		
