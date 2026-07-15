extends Node2D
var mousepos
@export var mousespeed=2
var active
var timesincemove: float
var mouseproportion
var visactive
var inuse
var menumode:bool=false
# Called when the node enters the scene tree for the first time.
func appear():
	Input.mouse_mode=Input.MOUSE_MODE_CONFINED_HIDDEN
	menumode=true 
	print("sfdsdf")
func leave():
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED
	menumode=false
func _ready() -> void: 
	#mouseproportion=1152/float(DisplayServer.window_get_size().x) 
	print(DisplayServer.window_get_size())
	
	mousepos=Vector2(0,0)
	$Icon.modulate.a=1
	active=false  
	visactive=false
	inuse=true
	#appear()
func activate():  
	active=true
	$Icon.position=get_viewport().get_visible_rect().get_center()
func deactivate():
	active=false
func _unhandled_input(event: InputEvent) -> void:
	
			
	if active:
		
		if event is InputEventMouseMotion: 
			timesincemove=0
			visactive=true
			var mousemovek=Vector2(event.relative.x,event.relative.y)
			$Icon.global_position+=mousemovek
			$Icon.global_position.x=clamp($Icon.global_position.x,0,get_viewport().get_visible_rect().size.x)
			$Icon.global_position.y=clamp($Icon.global_position.y,0,get_viewport().get_visible_rect().size.y)
# Called every frame. 'delta' is the elapsed time since the previous framehv.
func _process(delta: float) -> void:
	timesincemove+=delta
	if timesincemove>0.5:
		visactive=false
	if menumode:
		timesincemove=0
		visactive=true
		#$Icon.global_position.x=move_toward($Icon.global_position.x, get_viewport().get_mouse_position().x,10000*delta)
		#$Icon.global_position.y=move_toward($Icon.global_position.y, get_viewport().get_mouse_position().y,10000*delta)

		$Icon.global_position=get_viewport().get_mouse_position()
		if Input.is_action_pressed("mouseclick"):
			inuse=true	
		else:
			inuse=false
	var caminpdir=Input.get_vector("camera_left","camera_right","camera_up","camera_down")
	if Input.is_action_pressed("mousetoggle") and active:   
		timesincemove=0
		visactive=true
		$Icon.global_position+=caminpdir*mousespeed*delta*5
		$Icon.global_position.x=clamp($Icon.global_position.x,0,get_viewport().get_visible_rect().size.x)
		$Icon.global_position.y=clamp($Icon.global_position.y,0,get_viewport().get_visible_rect().size.y)
	mousepos=$Icon.global_position
	if visactive:
		if Input.is_action_pressed("mouseclick"):
			inuse=true	
		else:
			inuse=false
		if inuse:
			$Icon.modulate=lerp($Icon.modulate,Color(0.658, 0.658, 0.658, 1.0),7*delta)
			$Icon.scale=lerp($Icon.scale,Vector2(0.25,0.25),7*delta)
			timesincemove=0
			
		else:
			$Icon.modulate=lerp($Icon.modulate,Color(1.0, 1.0, 1.0, 1.0),7*delta)
			$Icon.scale=lerp($Icon.scale,Vector2(0.3,0.3),7*delta)
	else:
		$Icon.modulate=lerp($Icon.modulate,Color(1.0, 1.0, 1.0, 0.0),7*delta)
		$Icon.scale=lerp($Icon.scale,Vector2(0.3,0.3),7*delta)
