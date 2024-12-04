extends CanvasLayer
@onready var twr = get_parent()
var targeting_text = "◄ First►"
var upgrade_panel_color = Color(0.08, 0.3, 0.6, 1)

@onready var game_scene = get_parent().get_parent().get_parent()

func _ready():
	$FlowContainer/targeting.self_modulate = upgrade_panel_color
	$FlowContainer/damage.self_modulate = upgrade_panel_color
	$FlowContainer/range.self_modulate = upgrade_panel_color
	#print("◄".unicode_at(0))
	#print("►".unicode_at(0))
	#print("◄".to_ascii_buffer()[0])
	if twr.targeting_mode == "first":
		targeting_text = "◄ First ►"
	elif twr.targeting_mode == "strong":
		targeting_text = "◄ Strong ►"
	elif twr.targeting_mode == "last":
		targeting_text = "◄ Last ►"
	$FlowContainer/targeting/Label.text = str(targeting_text)
	
	if twr.damage_upgrade_counter > 0:
		$FlowContainer/damage/Label.text = "Max Damage"
	if twr.range_upgrade_counter > 0:
		$FlowContainer/range/Label.text = "Max Range"

func _on_targeting_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 0:
		if twr.targeting_mode == "first":
			twr.targeting_mode = "strong"
			targeting_text = "◄ Strong ►"
		elif twr.targeting_mode == "strong":
			twr.targeting_mode = "last"
			targeting_text = "◄ Last ►"
		elif twr.targeting_mode == "last":
			twr.targeting_mode = "first"
			targeting_text = "◄ First ►"
		else:
			print("targeting error")
			
		$FlowContainer/targeting/Label.text = targeting_text
		


func _on_damage_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 0:
		if twr.damage_upgrade_counter == 0 and game_scene.curr_gold >= 150:
			twr.damage = twr.damage * 2
			twr.damage_upgrade_counter += 1
			$FlowContainer/damage/Label.text = "Max Damage"
			game_scene.curr_gold -= 150
			
			
			# change color depending on upgrade
			if $FlowContainer/range/Label.text == "Max Range":
				twr.get_node("animated_sprite").play("idle_gold")
				twr.color = "gold"
				# rocket dino arm change
				if twr.get_node_or_null("dino_arm") != null:
					twr.color = "gold"
					twr.get_node("dino_arm").play("idle_gold")
			else:
				twr.get_node("animated_sprite").play("idle_purple")
				twr.color = "purple"
				# rocket dino arm change
				if twr.get_node_or_null("dino_arm") != null:
					twr.color = "blue"
					twr.get_node("dino_arm").play("idle_purple")
				
		else:
			pass


func _on_range_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 0:
		if twr.range_upgrade_counter == 0 and game_scene.curr_gold >= 100:
			twr.tower_range = twr.tower_range * 1.25
			twr.update_range()
			twr.range_upgrade_counter += 1
			$FlowContainer/range/Label.text = "Max Range"
			game_scene.curr_gold -= 100
			
			# change color depending on upgrade
			if $FlowContainer/damage/Label.text == "Max Damage":
				twr.get_node("animated_sprite").play("idle_gold")
				twr.color = "gold"
				# rocket dino arm change
				if twr.get_node_or_null("dino_arm") != null:
					twr.color = "gold"
					twr.get_node("dino_arm").play("idle_gold")
			else:
				twr.get_node("animated_sprite").play("idle_blue")
				twr.color = "blue"
				# rocket dino arm change
				if twr.get_node_or_null("dino_arm") != null:
					twr.color = "blue"
					twr.get_node("dino_arm").play("idle_blue")
			
	
			
		else:
			pass
			
		

func _on_sell_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if $FlowContainer/Sell.get_global_rect().has_point(event.global_position):
			sell_tower() # Replace with function body.

# TODO fix this code
func sell_tower() -> void:
	var base_tower_cost = 200
	var upgrade_value = 150
	var refund = base_tower_cost + (twr.damage_upgrade_counter + twr.range_upgrade_counter) * upgrade_value
	refund *= 0.75  
	game_scene.curr_gold += int(refund)
	twr.queue_free()
	queue_free()
