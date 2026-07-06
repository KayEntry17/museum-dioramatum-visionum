extends Control
@export var map:Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$bar.color=lerp($bar.color,map.albedo,4*delta)
	


func _on_exit_focus_entered() -> void:
	map.swap(8)


func _on_credits_focus_entered() -> void:
	map.swap(4)
#


func _on_credits_pressed() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	pass # Replace with function body.


func _on_exit_mouse_entered() -> void:
	map.swap(8)


func _on_new_game_focus_entered() -> void:
	map.swap(0)


func _on_new_game_pressed() -> void:
	#map.swap(8)
	pass


func _on_new_game_mouse_entered() -> void:
	map.swap(0)


func _on_options_focus_entered() -> void:
	map.swap(3)


func _on_options_mouse_entered() -> void:
	map.swap(3)


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_credits_mouse_entered() -> void:
	map.swap(4)
