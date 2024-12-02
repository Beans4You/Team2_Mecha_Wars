extends tower_projectile

func _ready():
	bullet_scene = preload("res://scenes/towers/turret/turret_laser.tscn")
	super._ready()
	
