extends Control
var paused:=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if !paused:
			paused=true
			Pause.pause()
			$AnimationPlayer.stop()
			#$AnimationPlayer.speed_scale=0.6
			$AnimationPlayer.play("spawn")
		else:
			paused=false
			$AnimationPlayer.stop()
			#$AnimationPlayer.speed_scale=-0.6
			$AnimationPlayer.play_backwards("spawn")
func animation_done():
	if paused:
			$Credits.grab_focus()
			Mouss.appear()
				
func animation_over():
	if !paused:
		Pause.unpause()
		Mouss.leave()
	
