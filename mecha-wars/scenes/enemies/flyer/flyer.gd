extends enemy_script

func _ready():
	$AnimatedSprite2D.play('move')
	self.speed = 90
	self.attack_damage = 5



func _on_hit_area_body_entered(body) -> void:
	if body.is_in_group("stronghold"):
		print("here")
		at_stronghold = true
		stronghold = body
