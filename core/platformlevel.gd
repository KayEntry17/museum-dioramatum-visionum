extends Area3D
var fpscam
var active=false
@export var selfcam:Node3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active:
		if Input.is_action_just_pressed("exitdiorama"):
			Cam.targetcam=fpscam
			print(fpscam)
			active=false
			await get_tree().create_timer(1.7).timeout
			Cam.fpsmode=true
func interact():
	if !active:
		print("la la la")
		fpscam=Cam.targetcam
		Cam.targetcam=selfcam
		Cam.fpsmode=false
		active=true
		
	
