extends KinematicBody2D


# Variable for the players speed that can be edited in the inspector
export var player_speed = 10
# Variable for player's velocity for movement
var velocity


# Function to get the player's input
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		$PlayerSprite.play("move")
		$PlayerSprite.flip_h = false
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		$PlayerSprite.play("move")
		$PlayerSprite.flip_h = true
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		$PlayerSprite.play("move")
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		$PlayerSprite.play("move")
	if velocity.x == 0 and velocity.y == 0:
		$PlayerSprite.play("idle")
	velocity = velocity.normalized() * player_speed


# Calling the get_input function per frame (delta)
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
