extends tower_projectile

func _ready():
	bullet_scene = preload("res://scenes/towers/turret/turret_laser.tscn")
	rate_of_fire = 0.37
	

	super._ready()
	self.gold_cost = 500
