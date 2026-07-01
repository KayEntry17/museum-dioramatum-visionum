extends Node3D
@export var rotspeed:float=7

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"..".active:
		var caminpdir=Input.get_vector("dioramaleft","dioramaright","camera_up","camera_down")
		self.rotation.y+=caminpdir.x*delta*rotspeed
		#$camcontroller.rotation.x+=caminpdir.x*delta
		$camcontroller.rotate(Vector3(-1.0,0.0,0), caminpdir.y*rotspeed*0.5*delta)
		$camcontroller.rotation_degrees.x=clamp($camcontroller.rotation_degrees.x, -35.0, 20.0)
