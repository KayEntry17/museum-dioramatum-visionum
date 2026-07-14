extends Label

func _process(delta: float) -> void:
	if get_parent().has_focus():
		$ColorRect.offset_transform_scale.x=lerp($ColorRect.offset_transform_scale.x,1.0,4*delta)
	else: 
		$ColorRect.offset_transform_scale.x=lerp($ColorRect.offset_transform_scale.x,0.0,4*delta)
