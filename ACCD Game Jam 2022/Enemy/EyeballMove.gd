extends KinematicBody2D


var velocity = Vector2()
export var direction = -1
onready var ray = $Sprites/Ray


# Called when the node enters the scene tree for the first time.
func _ready():
	if direction == 1:
		$Sprites.flip_h = true


func _physics_process(delta):
	if ray.is_colliding():
		if ray.get_collider().is_in_group("Wall"):
			direction = direction * -1
	
	velocity.x = 50 * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)
