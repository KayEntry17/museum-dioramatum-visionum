extends Node

@export var turnlist:Array[Node]
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#turn_off()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func turn_off():
	for i in turnlist:
		i.turn_off()
func turn_on():
	for i in turnlist:
		i.turn_on()
	
 
