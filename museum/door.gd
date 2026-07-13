@tool
extends MeshInstance3D
@export var on:bool
@export var speed:float=1.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if on:
		self.rotation_degrees.y=lerp(self.rotation_degrees.y,130.0,speed*delta)
	else:
		self.rotation_degrees.y=lerp(self.rotation_degrees.y,0.0,speed*delta)
func turn_on():
	on=true
func turn_off():
	on=false
	
