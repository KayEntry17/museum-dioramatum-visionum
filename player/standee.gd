extends CharacterBody3D
@export var speed: float=10
@export var inuse:bool=true
@export var jumpspeed:float =5

@export var slip: float=5

var canjump:bool
func _ready() -> void:
	speed*=0.1
	jumpspeed*=0.3
func _process(delta: float) -> void:
	canjump=is_on_floor()
	if not is_on_floor():
		velocity += get_gravity() * delta*0.5
		
	var inpdir=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	
			
	if inpdir==Vector2(0,0):
		velocity.x=move_toward(velocity.x,0,slip*delta*speed)
		velocity.z=move_toward(velocity.z,0,slip*delta*speed)
	else:
		velocity.x=speed*inpdir.x
		velocity.z=speed*inpdir.y	
	#print(velocity)
	if canjump and Input.is_action_just_pressed("ui_accept"):
		velocity.y=jumpspeed
		
	move_and_slide()
	
