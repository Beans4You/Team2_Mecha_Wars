extends enemy_script

func _ready():
	$AnimatedSprite2D.play('move')


func _on_hit_area_body_entered(body) -> void:
	if body.is_in_group("stronghold"):
		at_stronghold = true
		stronghold = body
