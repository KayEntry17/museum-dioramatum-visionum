
@tool 
extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"../Camera3D".rotation.y+=0.8*delta
	$"../Camera3D".rotation_degrees.y+=int($"../Camera3D".rotation_degrees.y)%360-int($"../Camera3D".rotation_degrees.y)
	self.rotation.z-=0.8*delta
	self.rotation_degrees.z+=int(self.rotation_degrees.z)%360-int(self.rotation_degrees.z)
