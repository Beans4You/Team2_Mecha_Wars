extends tower_projectile

func _ready():
	bullet_scene = preload("res://scenes/towers/turret/turret_laser.tscn")
	rate_of_fire = 0.35
extends tower_shooting

func _ready():
	super._ready()
	self.gold_cost = 500
