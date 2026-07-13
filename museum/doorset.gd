extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	turn_off()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func turn_off():
	$CollisionShape3D.disabled=false
	
func turn_on():
	$CollisionShape3D.disabled=true
	
