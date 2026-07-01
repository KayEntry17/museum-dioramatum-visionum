extends Node2D
var prevmousepos
var active
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	prevmousepos=Vector2(0,0)
	$Icon.modulate=Color(0.0, 0.0, 0.0, 0.0)
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
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active:
		$Icon.modulate=lerp($Icon.modulate,Color(1.0, 1.0, 1.0, 1.0),7*delta)
	else:
		$Icon.modulate=lerp($Icon.modulate,Color(1.0, 1.0, 1.0, 0.0),7*delta)
