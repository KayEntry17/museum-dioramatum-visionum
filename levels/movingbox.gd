#@tool
extends Node3D
@export var direction:Vector3
@export var distance:float
@export var interval:float=1.0
var basepos:Vector3
var progress: float=0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	basepos=position


 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print("babababa")
	#progress=0
	progress+=delta/interval
	progress=progress-int(progress)
	position=basepos+distance*direction*(sin(PI*progress*2)+1)/2.0
	#print(progress)
	
