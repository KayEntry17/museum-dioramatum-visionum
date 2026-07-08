extends CharacterBody3D
@export var speed: float=10
@export var inuse:bool=true
@export var jumpspeed:float =5
@export var enablemovement:bool=false
@export var slip: float=5
@export_category("Buffers")
@export var jumpbuffer:float=0.3
var sincejump:float=0
var sinceonground:float=0
@export var coyotetime:float=0.1
var startpos: Transform3D
var canjump:bool
func coyotefloor():
	if is_on_floor() or sinceonground<coyotetime:
		return true
	else:
		return false
func launch():
	global_transform=startpos
	#$MeshInstance3D.position=Vector3(0,0,0)
	$AnimationPlayer.play("start")
func leave():
	$AnimationPlayer.play("end")
func _ready() -> void:
	startpos=global_transform
	speed*=0.1
	visible=false
	jumpspeed*=0.3
func jump():
	sinceonground=1000
	velocity.y=jumpspeed
func _process(delta: float) -> void:
	#print(sincejump)
	sincejump-=delta
	if enablemovement:
		
		if not is_on_floor():
			velocity += get_gravity() * delta*0.5
			sinceonground+=delta
		else:
			sinceonground=0
			if sincejump>0:
				jump()
				sincejump=-1
			
			
		
		var inpdir=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
		#print(inpdir)
		
		inpdir=inpdir.rotated(-Cam.maincam.global_rotation.y)
		
		#print(Cam.maincam.global_position.angle_to(global_position))
		#print(inpddgtir)
				
		if inpdir==Vector2(0,0):
			velocity.x=move_toward(velocity.x,0,slip*delta*speed)
			velocity.z=move_toward(velocity.z,0,slip*delta*speed)
		else:
			velocity.x=speed*inpdir.x
			velocity.z=speed*inpdir.y
		#print(velocity)
		if Input.is_action_just_pressed("ui_accept"):
			if coyotefloor():
				sinceonground=1000
				jump()
				
			else:
				sincejump=jumpbuffer
			
		move_and_slide()
	
