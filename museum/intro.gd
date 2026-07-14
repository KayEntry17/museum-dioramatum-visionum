extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	introduce()
func mid_intro():
	Cam.theserthetargets($"../Node3D/falsecamx/falsecamy")
func end_intro():
	Cam.fpsmode=true
	Tut.do_it("Use WASD or Left Stick for movement,
Mouse or Right Stick for view.",3)

	
func midend_intro():
	$"../room1museum/Cube_017".on=false
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func introduce():
	Cam.theserthetargets($"../Camera3D2")
	Cam.fpsmode=false
	$"../AnimationPlayer".play("introk")
	$"../room1museum/Cube_017".on=true
