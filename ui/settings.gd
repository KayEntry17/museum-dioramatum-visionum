extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func launch():
	$"../AnimationPlayer".play("swap")
	$Control/Control.loads()
	$Control/Control2.loads()
	$Control/Control3.loads()
	$Control/OptionButton2.selected=Save.settings["antialiasing"]
	$Control/OptionButton.selected=Save.settings["graphics"]
	$Control/Control.grab_focus()
	


func _on_button_2_pressed() -> void:
	$"../AnimationPlayer".play_backwards("swap")
	Save.settings["antialiasing"]=$Control/OptionButton2.selected
	Save.settings["graphics"]=$Control/OptionButton.selected
	
	Save.save_game()
	$"../NewGame".grab_focus()
	


func _on_button_pressed() -> void:
	$"../AnimationPlayer".play_backwards("swap")
	Save.load_game()
	$"../NewGame".grab_focus()
