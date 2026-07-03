extends Area3D
var fpscam
var active=false
@export var camcontroller:Node3D
@export var selfcam:Node3D
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#interact()
@export var player:Node3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active:
		Cam.maincam.attributes.dof_blur_amount=lerp(Cam.maincam.attributes.dof_blur_amount,selfcam.attributes.dof_blur_amount,5*delta)
		#print(selfcam.fov)
		if Input.is_action_just_pressed("exitdiorama"):
			Cam.targetcam=fpscam
			player.leave()
			#print(fpscam)
			active=false
			var tweenb = get_tree().create_tween().set_trans(Tween.TRANS_QUART)
			tweenb.tween_property(Cam.maincam, "fov",90, 1.9)
			#print(Cam.maincam.attributes.dof_blur_amount)
			#var tweenx = get_tree().create_tween()
			Cam.maincam.dedof=true
			Mouss.deactivate()
			await get_tree().create_timer(1.9).timeout
			Cam.fpsmode=true
			
			
			#Cam.maincam.attributes.dof_blur_amount=0
			
func interact():
	if !active:
		print("la la la")
		player.launch()
		camcontroller.begin()
		var tweenx = get_tree().create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tweenx.tween_property(Cam.maincam, "fov",selfcam.fov, 1.0)
		var tween = get_tree().create_tween()
		tween.tween_property(Cam.maincam.attributes, "dof_blur_amount",selfcam.attributes.dof_blur_amount, 1.3)
		
		Mouss.activate()
		fpscam=Cam.targetcam
		Cam.targetcam=selfcam
		Cam.fpsmode=false
		active=true
		
	
