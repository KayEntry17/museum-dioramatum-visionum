extends Path3D
var on:bool=true

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#turnoff()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func turn_on():
	var tween = get_tree().create_tween()
	tween.tween_property($CSGPolygon3D.material, "shader_parameter/on",4.0, 2)
func turn_off():
	var tween = get_tree().create_tween()
	tween.tween_property($CSGPolygon3D.material, "shader_parameter/on",0.0, 2)
	
