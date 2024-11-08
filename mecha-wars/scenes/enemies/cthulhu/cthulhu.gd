extends enemy_script


func _ready():
	$AnimatedSprite2D.play('move')
	self.speed = 65
	self.attack_damage = 25
	self.health = 200
	self.gold_worth = 250


func _on_hit_area_body_entered(body) -> void:
	if body.is_in_group("stronghold"):
		at_stronghold = true
		stronghold = body


func _on_animated_sprite_2d_frame_changed() -> void:
	if $AnimatedSprite2D.frame == 3 and $AnimatedSprite2D.animation == 'attack':
		stronghold.take_damage(attack_damage)
