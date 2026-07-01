extends Node3D
@export var rotspeed:float=7

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var caminpdir=Input.get_vector("dioramaleft","dioramaright","camera_up","camera_down")
	self.rotation.y+=caminpdir.x*delta
