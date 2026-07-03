extends Node2D
var mousepos
@export var mousespeed=2
var active
var timesincemove: float
var mouseproportion
var visactive
var inuse
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#mouseproportion=1152/float(DisplayServer.window_get_size().x)
	print(DisplayServer.window_get_size())
	
	mousepos=Vector2(0,0)
	$Icon.modulate.a=1
	active=false
	visactive=false
	inuse=true
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
	#mouseproportion=1152/DisplayServer.window_get_size().x
	timesincemove+=delta
	if timesincemove>0.5:
		visactive=false
	var caminpdir=Input.get_vector("camera_left","camera_right","camera_up","camera_down")
	if Input.is_action_pressed("mousetoggle") and active:
		timesincemove=0
		visactive=true
		$Icon.global_position+=caminpdir*mousespeed*delta*5
		$Icon.global_position.x=clamp($Icon.global_position.x,0,get_viewport().get_visible_rect().size.x)
		$Icon.global_position.y=clamp($Icon.global_position.y,0,get_viewport().get_visible_rect().size.y)
	mousepos=$Icon.global_position
	if visactive:
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
