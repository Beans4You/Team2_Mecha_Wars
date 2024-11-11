extends tower_projectile

func _ready():
	bullet_scene = preload("res://scenes/towers/turret/turret_laser.tscn")
	rate_of_fire = 0.33
	tower_range = 600
	gold_cost = 500

	super._ready()
	
