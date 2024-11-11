extends tower_projectile

func _ready():
	bullet_scene = preload("res://scenes/towers/turret/turret_laser.tscn")
	rate_of_fire = 0.5
	tower_range = 500
	gold_cost = 200

	super._ready()
