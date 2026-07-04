extends SubViewport

func _ready():
	get_tree().root.size_changed.connect(on_viewport_size_changed)
	adjust()


func on_viewport_size_changed():
	adjust()
# Called when the node enters the scene tree for the first time
func adjust():
	self.size=DisplayServer.window_get_size()
	print(self.size)
