extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.max_value = get_parent().max_health
	self.value = max_value


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
