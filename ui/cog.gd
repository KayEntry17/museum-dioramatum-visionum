@tool
extends Node3D
var time
@export var active:=false
var rotspeed
var heightoffset
@export var lerpspeed:=20.0
@export var albedo:Color
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time=0
	active=false
	heightoffset=3.1
	rotspeed=0.5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time+=delta
	#print(delta)
	if active:
		rotspeed=lerp(rotspeed,0.7,lerpspeed*delta)
		$MeshInstance3D.position.z=lerp($MeshInstance3D.position.z,-0.23*1.2,lerpspeed*delta)
		$MeshInstance3D.position.x=lerp($MeshInstance3D.position.x,-0.835*1.2,lerpspeed*delta)
		heightoffset=lerp(heightoffset,5.5,lerpspeed*delta)
		$MeshInstance3D.scale=lerp($MeshInstance3D.scale,Vector3(1.2,1.2,1.2),lerpspeed*delta)
		$MeshInstance3D.get_surface_override_material(0).albedo_color=lerp($MeshInstance3D.get_surface_override_material(0).albedo_color,albedo,lerpspeed*delta)

	else:
		rotspeed=lerp(rotspeed,0.7,lerpspeed*delta)
		heightoffset=lerp(heightoffset,3.0,lerpspeed*delta)
		$MeshInstance3D.position.z=lerp($MeshInstance3D.position.z,-0.23,lerpspeed*delta)
		$MeshInstance3D.position.x=lerp($MeshInstance3D.position.x,-0.835,lerpspeed*delta)
		
		$MeshInstance3D.scale=lerp($MeshInstance3D.scale,Vector3(1.0,1.0,1.0),lerpspeed*delta)
		$MeshInstance3D.get_surface_override_material(0).albedo_color=lerp($MeshInstance3D.get_surface_override_material(0).albedo_color,Color(1.0, 1.0, 1.0, 1.0),lerpspeed*delta)
	self.rotation.y+=0.8*delta
	$MeshInstance3D.position.y=(sin(time))*rotspeed+heightoffset
	
	#print(90)
