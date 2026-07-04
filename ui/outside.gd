@tool
extends MeshInstance3D
@export var chosen:=false
@export var color:Color
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#color=get_surface_override_material(0).albedo_color
	get_child(0).albedo=color
	get_surface_override_material(0).albedo_color=Color(1.0, 1.0, 1.0, 1.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if chosen: 
		Cam.targetcam=get_child(1)
		get_child(0).active=true
		get_surface_override_material(0).albedo_color=lerp(get_surface_override_material(0).albedo_color,color,3*delta)
	else:
		get_child(0).active=false
		get_surface_override_material(0).albedo_color=lerp(get_surface_override_material(0).albedo_color,Color(1.0, 1.0, 1.0, 1.0),3*delta)
		
