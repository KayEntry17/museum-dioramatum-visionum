extends Node3D
@export var roomset: Array[Node3D]
var curroom:int=0
var albedo:=Color("575757")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Cam.fpsmode=false
	swap(0)

#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#
	#if Input.is_action_just_pressed("ui_accept"):
		#print(curroom)
		#swap(curroom+1)
func swap(roomnumb):
	roomnumb=roomnumb%roomset.size()
	roomset[curroom].chosen=false
	roomset[roomnumb].chosen=true
	curroom=roomnumb
	albedo=roomset[curroom].color
	#print(curroom)
