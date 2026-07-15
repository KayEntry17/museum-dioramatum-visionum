extends Area3D
@export_multiline var text:String
@export var time:=1.5

var used=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	used=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	#print(used)
	if !used:
		
		if body.is_in_group("player"):
			Tut.do_it(text,time)
			used=true
