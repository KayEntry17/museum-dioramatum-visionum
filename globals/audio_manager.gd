extends AudioStreamPlayer
var track: AudioStream
var loopf: bool=true
var chanon:bool=false
var loopi: bool=true
#var onch:=1.0 
var fitime:=1.0
var volv:=-60
var mon:=true 
#func _ready() -> void:
	#if chanon==true	:
		#volv=60

func change_track(song : AudioStream, loopim=true, foti=1.25,fiti=1) -> void:
	print(12414) 
	track=song
	loopi=loopim
	fitime=fiti 
	
	if playing:
		if self.stream==track:
			pass
		else:
			
			if foti!=0:
				$TransitionTimer.start(foti)
				fade_out(foti)
			else:
				fade_out(foti)
				loopf=loopi
				self.stream =track
				print(track)
				play()
				fade_in()
			pass
	else:	
		loopf=loopi
		volv=-60	
		self.stream =track
		print(track)
		print(fitime)
		play()
		fade_in()		
func fade_in() -> void:
	print(000)
	var tween = create_tween()
	tween.tween_property(self, "volv",0, fitime).set_trans(Tween.TRANS_QUAD)		
func fade_out(foti=1.25) -> void:
	var tween = create_tween()
	tween.tween_property(self, "volv",-60, foti).set_trans(Tween.TRANS_QUAD)			
func _on_finished() -> void:
	print(8806)
	if loopf:
		play()
		print(8807)
func _process(delta: float) -> void:
	#print(stream)
	
	self.volume_db=volv
func _on_transition_timer_timeout() -> void:
	print(11)
	loopf=loopi
	self.stream =track
	#print(track)
	play()
	fade_in()
