extends enemy_script

var init_health

func _ready():
	$AnimatedSprite2D.play('move')
	$AnimatedSprite2D.flip_h = true
	init_health = health


func _on_timer_timeout() -> void:
	if health <= .6 * init_health and health >= .3 * init_health:
		$damage_indicator.frame = 1
	elif health <= .3 * init_health:
		$damage_indicator.frame = 2
