extends Node
var pauses=0
func pause():
	
	pauses+=1
	print(pauses)
	get_tree().paused=true
func unpause():
	pauses=0
	print(pauses)
	if pauses==0:
		get_tree().paused=false
func frame_freeze(ts,dur):
	Engine.time_scale=ts
	await get_tree().create_timer(dur*ts).timeout
	Engine.time_scale=1.0
