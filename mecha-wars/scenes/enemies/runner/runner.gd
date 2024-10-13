extends enemy

signal stronghold_attack(damage)

func _on_animated_sprite_2d_animation_looped() -> void:
	pass
	#if $AnimatedSprite2D.animation == 'attack':
		#stronghold_attack.emit(damage)
