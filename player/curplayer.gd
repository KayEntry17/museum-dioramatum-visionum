extends CharacterBody3D
@export var speed: float=10
@export var inuse:bool=true
@export var jumpspeed:float =5
@export var slip: float=5
var Sensitivity:float=1
var canjump:bool
func _ready() -> void:
	Cam.theserthetargets($falsecam)
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion: 
		var mousemovek=Vector2(event.relative.x*Sensitivity,event.relative.y*Sensitivity)
		$CollisionShape3D/MeshInstance3D.rotate(Vector3(1,0,0), mousemovek.x)
		print(str(mousemovek)+"oaijdsoajsdioaks")
func _process(delta: float) -> void:
	if Cam.fpsmode:
		Input.mouse_mode=Input.MOUSE_MODE_CAPTURED 
	else:
		Input.mouse_mode=Input.MOUSE_MODE_VISIBLE
	canjump=is_on_floor()
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	var inpdir=Input.get_vector("ui_left","ui_right","ui_down","ui_up")
	

	
	if inpdir==Vector2(0,0):
		velocity.x=move_toward(velocity.x,0,slip*delta*speed)
		velocity.z=move_toward(velocity.z,0,slip*delta*speed)
	else:
		velocity.x=speed*inpdir.x
		velocity.z=speed*inpdir.y	
	#print(velocity)
	if canjump and Input.is_action_just_pressed("ui_accept"):
		velocity.y=jumpspeed
		
	move_and_slide()
	
