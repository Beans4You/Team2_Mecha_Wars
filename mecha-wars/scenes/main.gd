extends Node

@export var runner_scene : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $"Start Screen".visible == false:
		$UI.show()
		
		


#
#func new_game():
	#
	#print("st")
