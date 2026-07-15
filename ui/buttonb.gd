@tool
extends TextureButton
@export var active:=false
@export var moveamount:float=200
@export var label:String="New Game"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text=label
	
func switch_name(text):
	$Label.text=text
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active:
		$Label.position.x=lerp($Label.position.x,1180.0-300+moveamount,5*delta)
		$NinePatchRect.size.x=lerp($NinePatchRect.size.x,1148.0-300+moveamount,5*delta)
	else:
		$Label.position.x=lerp($Label.position.x,1180.0-300,5*delta)
		$NinePatchRect.size.x=lerp($NinePatchRect.size.x,1148.0-300,5*delta)
func _on_focus_entered() -> void:
	active=true


func _on_focus_exited() -> void:
	active=false


func _on_mouse_entered() -> void:
	active=true


func _on_mouse_exited() -> void:
	active=false
