extends enemy_script

var init_health

func _ready():
	$AnimatedSprite2D.play('move')
	init_health = health


func _on_hit_area_body_entered(body) -> void:
	if body.is_in_group("stronghold"):
		at_stronghold = true
		stronghold = body


func _on_timer_timeout() -> void:
	if health <= .6 * init_health and health >= .3 * init_health:
		$damage_indicator.frame = 1
	elif health <= .3 * init_health:
		$damage_indicator.frame = 2
