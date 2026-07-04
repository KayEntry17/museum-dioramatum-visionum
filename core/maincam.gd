extends Camera3D
var targetcam
@export var movespeed:float=4
@export var rotspeed:float=5
var dedof:bool=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Cam.theserthedroids(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.

func shoot_ray(mask):
	var mouse_pos = Mouss.mousepos
	var ray_lenght = 1000
	var from = project_ray_origin(mouse_pos)
	var to = from + project_ray_normal(mouse_pos) * ray_lenght
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.collision_mask = mask
	
	ray_query.from = from
	ray_query.to = to
	var raycast_results = space.intersect_ray(ray_query)
	print(raycast_results)
	return raycast_results
func _process(delta: float) -> void:
	#print(attributes.dof_blur_amount)
	#print(targetcam)
	if dedof:
		if attributes.dof_blur_amount==0:
			dedof=false
		else:
			attributes.dof_blur_amount=move_toward(attributes.dof_blur_amount,0,0.2/1.7*delta)
	if Cam.targetcam==null:
		if Cam.targetcam!=null:
			targetcam=Cam.targetcam
			self.global_position=targetcam.global_position
	else:
		if Cam.targetcam!=targetcam:
			targetcam=Cam.targetcam
		if Cam.fpsmode:
			#print(Cam.targetcam)
			self.global_position=targetcam.global_position
			#self.global_position.y=move_toward(self.global_position.y,targetcam.global_position.y,100*delta)
			#self.global_position.x=move_toward(self.global_position.x,targetcam.global_position.x,100*delta)
			if Cam.rotinterpolation:
			#self.global_rotation=targetcam.global_rotation
			
				self.global_rotation.x=lerp_angle(self.global_rotation.x,targetcam.global_rotation.x,20*delta)
				self.global_rotation.y=lerp_angle(self.global_rotation.y,targetcam.global_rotation.y,20*delta)
			else:
				self.global_rotation=targetcam.global_rotation
		else:
			self.global_position.x=lerp(self.global_position.x,targetcam.global_position.x,movespeed*delta)
			self.global_position.y=lerp(self.global_position.y,targetcam.global_position.y,movespeed*delta)
			self.global_position.z=lerp(self.global_position.z,targetcam.global_position.z,movespeed*delta)
			#print("hjoasdjof"+str(self.global_position))
			#print(targetcam.global_position)
			#self.global_rotation=targetcam.global_rotation
			if Cam.rotinterpolation:
				self.global_rotation.x=lerp_angle(self.global_rotation.x,targetcam.global_rotation.x,5*delta)
				self.global_rotation.y=lerp_angle(self.global_rotation.y,targetcam.global_rotation.y,5*delta)
			else:
				self.global_rotation=targetcam.global_rotation
			#self.global_transform=targetcam.global_transform
	 		
	
