extends Node2D
var mousepos
@export var mousespeed=2
var active
var mouseproportion
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouseproportion=1152/float(DisplayServer.window_get_size().x)
	print(DisplayServer.window_get_size())
	
	mousepos=Vector2(0,0)
	$Icon.modulate.a=1
	active=false
	
func activate():
	active=true
	$Icon.position=get_viewport().get_visible_rect().get_center()
func deactivate():
	active=false
func _unhandled_input(event: InputEvent) -> void:
	if active:
		
		if event is InputEventMouseMotion: 
			var mousemovek=Vector2(event.relative.x,event.relative.y)
			$Icon.global_position+=mousemovek
			$Icon.global_position.x=clamp($Icon.global_position.x,0,get_viewport().get_visible_rect().size.x)
			$Icon.global_position.y=clamp($Icon.global_position.y,0,get_viewport().get_visible_rect().size.y)
# Called every frame. 'delta' is the elapsed time since the previous framehv.
func _process(delta: float) -> void:
	#mouseproportion=1152/DisplayServer.window_get_size().x
	
	var caminpdir=Input.get_vector("camera_left","camera_right","camera_up","camera_down")
	if Input.is_action_pressed("mousetoggle"):
		$Icon.global_position+=caminpdir*mousespeed*delta*mouseproportion
	mousepos=$Icon.global_position
	if active:
		$Icon.modulate.a=lerp($Icon.modulate.a,1.0,7*delta)
	else:
		$Icon.modulate.a=lerp($Icon.modulate.a,0.0,7*delta)
