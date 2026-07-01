extends Node
var targetcam
var maincam
var fpsmode:bool=true
var mousemove
var prevmouse
var rotinterpolation:bool=true
var Sensitivity:float=1
# Called when the node enters the scene tree for the first time.
func theserthedroids(cam):
	maincam=cam
func theserthetargets(cam):
	targetcam=cam
#func _unhandled_input(event: InputEvent) -> void:
	#if event is InputEventMouseMotion: 
		#var mousemovek=Vector2(event.relative.x*Sensitivity,event.relative.y*Sensitivity)
		#print(mousemovek)
