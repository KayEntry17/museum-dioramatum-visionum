extends HSlider

@export var bus_name: String
var bus_ind: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.min_value=0.0001
	bus_ind=AudioServer.get_bus_index(bus_name)

	AudioServer.set_bus_volume_db(bus_ind,linear_to_db(value))
	print(AudioServer.get_bus_index(bus_name))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_ind,linear_to_db(value))
