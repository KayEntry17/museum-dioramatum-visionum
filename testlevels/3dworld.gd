extends Node3D
@export var direction:Vector3
@export var distance:float
@export var interval:float=1.0
var basepos:Vector3
var on: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	basepos=position
	on=false


 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print("babababa")
	#progress=0
	if on:
		position=lerp(position,basepos+distance*direction,delta*4)
	else:
		position=lerp(position,basepos,delta*4)
	#print(progress)
func turn():
	if get_parent().active:
		on=!on	
