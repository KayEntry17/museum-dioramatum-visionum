extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_parent().active==true:
		$MeshInstance3D.get_active_material(0).set_shader_parameter("transparency",lerp($MeshInstance3D.get_active_material(0).get_shader_parameter("transparency"),1.0,1*delta))
	else:
		$MeshInstance3D.get_active_material(0).set_shader_parameter("transparency",lerp($MeshInstance3D.get_active_material(0).get_shader_parameter("transparency"),0.0,3*delta))


func _on_body_entered(body: Node3D) -> void:
		if body.is_in_group("standee"):
			body.win()
			get_parent().finish()
