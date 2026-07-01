extends CharacterBody3D
#@export var speed: float=10
#@export var inuse:bool=true
#@export var jumpspeed:float =5
#@export var camspeed:float =5
#@export var slip: float=5
#@export var Sensitivity:float=1.0
#var canjump:bool
#func _process(delta: float) -> void:
	#if Cam.fpsmode:
		#Input.mouse_mode=Input.MOUSE_MODE_CAPTURED 
	#else:
		#Input.mouse_mode=Input.MOUSE_MODE_VISIBLE
	#canjump=is_on_floor()
	#if not is_on_floor():
		#velocity += get_gravity() * delta
		#
	#var inpdir=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	#var caminpdir=Input.get_vector("camera_left","camera_right","camera_up","camera_down")
	#$falsecamx.rotate(Vector3(0,-1.0,0), caminpdir.x*camspeed*delta)
	#$falsecamx/falsecamy.rotate(Vector3(-1.0,0.0,0), caminpdir.y*camspeed*delta)
	#$falsecamx/falsecamy.rotation_degrees.x=clamp($falsecamx/falsecamy.rotation_degrees.x, -55.0, 55.0)
	#print(inpdir)
	#inpdir=inpdir.rotated(-$falsecamx.rotation.y)
	#print($falsecamx.rotation)
	#
			#
	#if inpdir==Vector2(0,0):
		#velocity.x=move_toward(velocity.x,0,slip*delta*speed)
		#velocity.z=move_toward(velocity.z,0,slip*delta*speed)
	#else:
		#velocity.x=speed*inpdir.x
		#velocity.z=speed*inpdir.y	
	##print(velocity)
	#if canjump and Input.is_action_just_pressed("ui_accept"):
		#velocity.y=jumpspeed
		#
	#move_and_slide()
	#
