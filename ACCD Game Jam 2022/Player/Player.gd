extends KinematicBody2D


# Variable for the players speed that can be edited in the inspector
export var player_speed = 10
# Variable for player's velocity for movement
var velocity
enum Direction {UP, DOWN, LEFT, RIGHT}
#onready var global = "res://GLOBAL.gd"
var dir

# On ready, turn off collision shapes
func _ready():
	$CollisionLeft.disabled = true
	$CollisionRight.disabled = true
	$Collision.disabled = false
	dir = Direction.UP

# Function to get the player's input
func get_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		dir = Direction.RIGHT
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		dir = Direction.LEFT
		
	# Since UP/DOWN are at the end of the if-statements, they are prioritized in direction
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		dir = Direction.DOWN
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		dir = Direction.UP
	
	# (Hopefully) Places player direction in global instance
#	global.player_dir = dir
	
	# Movement animation
	match dir:
		Direction.RIGHT:				# RIGHT
			$PlayerSprite.play("right_move")
			$CollisionLeft.disabled = true
			$CollisionRight.disabled = false
			$Collision.disabled = true
		Direction.LEFT:				# LEFT
			$PlayerSprite.play("left_move")
			$CollisionLeft.disabled = false
			$CollisionRight.disabled = true
			$Collision.disabled = true
		Direction.DOWN:				# DOWN
			$PlayerSprite.play("front_move")
			$CollisionLeft.disabled = true
			$CollisionRight.disabled = true
			$Collision.disabled = false
		Direction.UP:				# UP
			$PlayerSprite.play("back_move")
			$CollisionLeft.disabled = true
			$CollisionRight.disabled = true
			$Collision.disabled = false

	# Idle and determine which idle to use
	if velocity.x == 0 and velocity.y == 0:
		$PlayerSprite.stop()
		match dir:
			Direction.RIGHT:				# RIGHT
				$PlayerSprite.play("right")
			Direction.LEFT:				# LEFT
				$PlayerSprite.play("left")
			Direction.DOWN:				# DOWN
				$PlayerSprite.play("front")
			Direction.UP:				# UP
				$PlayerSprite.play("back")

	velocity = velocity.normalized() * player_speed
# Calling the get_input function per frame (delta)
func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
