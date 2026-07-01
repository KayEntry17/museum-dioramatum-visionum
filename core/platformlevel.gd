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
		Cam.maincam.attributes.dof_blur_amount=lerp(Cam.maincam.attributes.dof_blur_amount,$camcontroller/Camera3D.attributes.dof_blur_amount,5*delta)
		#print($camcontroller/Camera3D.fov)
		if Input.is_action_just_pressed("exitdiorama"):
			Cam.targetcam=fpscam
			print(fpscam)
			active=false
			var tweenb = get_tree().create_tween().set_trans(Tween.TRANS_QUART)
			tweenb.tween_property(Cam.maincam, "fov",90, 1.7)
			print(Cam.maincam.attributes.dof_blur_amount)
			var tweenx = get_tree().create_tween()
			Cam.maincam.dedof=true
			await get_tree().create_timer(1.7).timeout
			Cam.fpsmode=true
			
			
			Cam.maincam.attributes.dof_blur_amount=0
			
func interact():
	if !active:
		print("la la la")
		var tweenx = get_tree().create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tweenx.tween_property(Cam.maincam, "fov",$camcontroller/Camera3D.fov, 1.0)
		var tween = get_tree().create_tween()
		tween.tween_property(Cam.maincam, "attributes.dof_blur_amount",$camcontroller/Camera3D.attributes.dof_blur_amount, 1.3)
		
		
		fpscam=Cam.targetcam
		Cam.targetcam=selfcam
		Cam.fpsmode=false
		active=true
		
	
