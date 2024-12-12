extends tower_projectile

func _ready():
	bullet_scene = preload("res://scenes/towers/turret/turret_laser.tscn")
	super._ready()

func shoot():
	super.shoot()	
	var audio_node = AudioStreamPlayer2D.new()
	# Load the audio file 
	var audio_stream = load("res://resources/sound/laser-104024.mp3") 
	audio_node.stream = audio_stream
	get_parent().get_parent().add_child(audio_node)
	audio_node.volume_db = -20
	audio_node.play() # Play the sound
	
