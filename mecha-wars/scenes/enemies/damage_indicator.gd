extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_child_count() == 1:
		await $Timer.timeout
		$Timer.queue_free()
	
	if get_parent().health <= .5 * get_parent().init_health and get_parent().health >= .2 * get_parent().init_health:
		frame = 1
	elif get_parent().health <= .2 * get_parent().init_health:
		frame = 2
