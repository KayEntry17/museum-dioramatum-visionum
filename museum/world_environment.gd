extends WorldEnvironment


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Save.settings["graphics"]==0:
		environment.ambient_light_energy=0.1
	else:
		environment.ambient_light_energy=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
