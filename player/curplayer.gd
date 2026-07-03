extends CharacterBody3D
@export var speed: float=10
@export var inuse:bool=true
@export var jumpspeed:float =5
@export var camspeed:float =5
@export var slip: float=5
@export var Sensitivity:float=1.0
var canjump:bool
func _ready() -> void:
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED 
	Cam.theserthetargets($falsecamx/falsecamy)
	print(Cam.targetcam)
	Cam.fpsmode=true
func _unhandled_input(event: InputEvent) -> void:
	if Cam.fpsmode:
		if event is InputEventMouseMotion: 
			var mousemovek=Vector2(event.relative.x*Sensitivity*0.05,event.relative.y*Sensitivity*0.05)
			$falsecamx.rotate(Vector3(0,-1.0,0), mousemovek.x)
			$falsecamx/falsecamy.rotate(Vector3(-1.0,0.0,0), mousemovek.y)
			$falsecamx/falsecamy.rotation_degrees.x=clamp($falsecamx/falsecamy.rotation_degrees.x, -55.0, 55.0)
		#print(str(mousemovek)+"oaijdsoajsdioaks")
func _process(delta: float) -> void:

	
	canjump=is_on_floor()
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	var inpdir=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	var caminpdir=Input.get_vector("camera_left","camera_right","camera_up","camera_down")
	if Cam.fpsmode:
		$falsecamx.rotate(Vector3(0,-1.0,0), caminpdir.x*camspeed*delta)
		$falsecamx/falsecamy.rotate(Vector3(-1.0,0.0,0), caminpdir.y*camspeed*delta)
		$falsecamx/falsecamy.rotation_degrees.x=clamp($falsecamx/falsecamy.rotation_degrees.x, -55.0, 55.0)
	#print(inpdir)
	inpdir=inpdir.rotated(-$falsecamx.global_rotation.y)
	#print($falsecamx.rotation)
	if Input.is_action_just_pressed("interact") and Cam.fpsmode:
		var arealist=$falsecamx/falsecamy/Area3D.get_overlapping_areas()
		
		if arealist!=[]:
			for i in range(arealist.size()):
				if arealist[i].has_method("interact"):
					arealist[i].interact()
					
					break
	if inpdir==Vector2(0,0):
		velocity.x=move_toward(velocity.x,0,slip*delta*speed)
		velocity.z=move_toward(velocity.z,0,slip*delta*speed)
	else:
		velocity.x=speed*inpdir.x
		velocity.z=speed*inpdir.y	
	#print(velocity)
	if canjump and Input.is_action_just_pressed("ui_accept") and Cam.fpsmode:
		velocity.y=jumpspeed
	if Cam.fpsmode:	
		move_and_slide()
	
