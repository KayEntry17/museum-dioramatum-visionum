extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Cam.theserthetargets($"../Camera3D2")
	Cam.fpsmode=false
	$"../AnimationPlayer".play("introk")
	$"../room1museum/Cube_017".on=true
func mid_intro():
	Cam.theserthetargets($"../Node3D/falsecamx/falsecamy")
func end_intro():
	Cam.fpsmode=true
	
func midend_intro():
	$"../room1museum/Cube_017".on=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
