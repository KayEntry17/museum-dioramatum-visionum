extends Camera3D
var targetcam
@export var movespeed:float=10
@export var rotspeed:float=5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Cam.theserthedroids(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if targetcam==null:
		if Cam.targetcam!=null:
			targetcam=Cam.targetcam
			self.global_position=targetcam.global_position
	if Cam.targetcam!=targetcam:
		targetcam=Cam.targetcam
	if Cam.fpsmode:
		self.global_position=targetcam.global_position
		self.global_rotation=targetcam.global_rotation
	else:
		self.global_position=lerp(self.global_position,targetcam.global_position,2*delta)
	
