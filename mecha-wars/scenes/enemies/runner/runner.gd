extends enemy_script

var init_health
var cur_x
var last_x = 0
var cur_y 
var last_y = 0

func _ready():
	$AnimatedSprite2D.play('move')
	$AnimatedSprite2D.flip_h = true
	init_health = health
	last_y = round(global_position.y)


func _process(delta):
	super(delta)
	
	cur_x = round(global_position.x)
	if (cur_x < last_x):
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
	last_x = cur_x
	
	cur_y = round(global_position.y)
	if (cur_y > last_y):
		$AnimatedSprite2D.rotation_degrees = 90
	elif (cur_y < last_y):
		$AnimatedSprite2D.rotation_degrees = 270
	elif (cur_y == last_y):
		$AnimatedSprite2D.rotation_degrees = 0
	last_y = cur_y

func _on_timer_timeout() -> void:
	if health <= .6 * init_health and health >= .3 * init_health:
		$damage_indicator.frame = 1
	elif health <= .3 * init_health:
		$damage_indicator.frame = 2
