extends Node
@export var scenesuseful:Array[PackedScene]
var transitioning=false
var nextscene=0
func change_scene(scenenumb):
	Pause.pause()
	transitioning=true
	nextscene=scenenumb
	$AnimationPlayer.play("troon")
func end_anim():
	if transitioning:
		transitioning=false
		get_tree().change_scene_to_packed(scenesuseful[nextscene])
		await get_tree().create_timer(0.1).timeout
		$AnimationPlayer.play_backwards("troon")
func over_anim():
	if !transitioning:
		Pause.unpause()
