extends Node3D
@export var rotspeed:float=7
var mouseposprev
# Called when the node enters the scene tree for the first time.
@export var selfcam:Node3D
@export var path:Path3D
@export var pathuse:bool=false
var mousemoving:=false
@export var player:Node3D
func begin():
	var mcpos=Vector2(Cam.maincam.global_position.x-global_position.x,Cam.maincam.global_position.z-global_position.z).angle()
	self.global_rotation.y=-(mcpos- PI / 2)
	print(global_rotation_degrees)
	print($camcontroller.rotation_degrees)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"..".active:
		if pathuse:
			
			self.global_position=path.global_position+path.curve.get_closest_point(player.global_position-path.global_position)
		var caminpdir
		if !Input.is_action_pressed("mousetoggle"):
			caminpdir=Input.get_vector("dioramaleft","dioramaright","camera_up","camera_down")
		else:
			caminpdir=Vector2(0,0)
		self.rotation.y+=caminpdir.x*delta*rotspeed
		#$camcontroller.rotation.x+=caminpdir.x*delta
		$camcontroller.rotate(Vector3(-1.0,0.0,0), caminpdir.y*rotspeed*0.5*delta)
		$camcontroller.rotation_degrees.x=clamp($camcontroller.rotation_degrees.x, -35.0, 20.0)
		if  Mouss.active and Input.is_action_just_pressed("mouseclick"):
			var raycast=Cam.maincam.shoot_ray(1 << (7 - 1))
			if !raycast=={}:
				mouseposprev=Mouss.mousepos
				mousemoving=true
		
		if  Mouss.active and Input.is_action_pressed("mouseclick") and mousemoving:
			
			var mousemoved=mouseposprev-Mouss.mousepos
			mouseposprev=Mouss.mousepos
			mousemoved*=0.1
			$camcontroller.rotate(Vector3(-1.0,0.0,0),mousemoved.y*rotspeed*0.5*delta)
			self.rotation.y+=mousemoved.x*delta*rotspeed
			$camcontroller.rotation_degrees.x=clamp($camcontroller.rotation_degrees.x, -35.0, 20.0)
		else:
			mousemoving=false
	else:mousemoving=false
	if mousemoving:
		Mouss.inuse=true
	else:
		Mouss.inuse=false
