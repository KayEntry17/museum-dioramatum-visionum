extends HSlider

@export var bus_name: String
var bus_ind: int
var on:bool=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.min_value=0.0001
	bus_ind=AudioServer.get_bus_index(bus_name)
	#self.value=b
	AudioServer.set_bus_volume_db(bus_ind,linear_to_db(value))
	print(AudioServer.get_bus_index(bus_name))
	$Label.text=bus_name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if on:
		$Label/ColorRect.offset_transform_scale.x=lerp($Label/ColorRect.offset_transform_scale.x,1.0,4*delta)
	else: 
		$Label/ColorRect.offset_transform_scale.x=lerp($Label/ColorRect.offset_transform_scale.x,0.0,4*delta)


func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_ind,linear_to_db(value))


func _on_focus_entered() -> void: 
	on=true
	


func _on_focus_exited() -> void:
	on=false
