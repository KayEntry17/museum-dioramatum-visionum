extends Node2D

@export var menutheme:AudioStream
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Audio.change_track(menutheme)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func end():
	Transition.change_scene(0)  
