extends Control
var paused:=false
var fin:=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if !paused:
			if !fin:
				paused=true
				Pause.pause()
				$AnimationPlayer.stop()
				#$AnimationPlayer.speed_scale=0.6
				$AnimationPlayer.play("spawn")
		else:
			unpause()
func animation_done():
	if paused:
			$Credits.grab_focus()
			Mouss.appear()
				
func animation_over():
	if !paused:
		Pause.unpause()
		Mouss.leave()
func unpause():
	if paused:
		paused=false
		$AnimationPlayer.stop()
		#$AnimationPlayer.speed_scale=-0.6
		$AnimationPlayer.play_backwards("spawn")
	


func _on_credits_pressed() -> void:
	unpause()


func _on_exit_pressed() -> void:
	if paused:
		Transition.change_scene(0)
		fin=true
		paused=false
