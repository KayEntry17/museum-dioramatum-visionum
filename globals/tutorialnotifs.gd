extends Control
var on:bool=false
var off:bool=true
var notiflist:Array[Array]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func do_it(text,time): 
	if !on:
		on=true
		$ColorRect/Label.text=text
		$AnimationPlayer.play("appear")
		await get_tree().create_timer(time,false).timeout
		$AnimationPlayer.play_backwards("appear")
		off=false
	else:
		notiflist.append([text,time])
func end():
	if !off:
		off=true
		on=false
		if notiflist!=[]:
			do_it(notiflist[0][0],notiflist[0][1])
			notiflist.pop_at(0)
	
