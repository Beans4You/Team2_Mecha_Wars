extends enemy_script


func _ready():
	$AnimatedSprite2D.play('move')
	$AnimatedSprite2D.flip_h = true
	self.speed = 140
	self.gold_worth = 25
