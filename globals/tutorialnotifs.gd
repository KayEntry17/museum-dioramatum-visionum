extends Control
var on:bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func do_it(text,time):
	if !on:
		$ColorRect/Label.text=text
		$AnimationPlayer.play("appear")
		await get_tree().create_timer(time).timeout
	
