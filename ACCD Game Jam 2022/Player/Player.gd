extends KinematicBody2D


# Variable for the players speed that can be edited in the inspector
export var player_speed = 1400
var speed = player_speed
#export var move_speed : = 750.0
export var push_speed : = 325.0
var freeze = false

#export var knockback_force = 50
# Variable for player's velocity for movement
var velocity = Vector2(0,0)
enum Direction {UP, DOWN, LEFT, RIGHT}
var dir
var hit = 0
signal damaged

# On ready, turn off collision shapes
func _ready():
	$CollisionLeft.disabled = true
	$CollisionRight.disabled = true
	$Collision.disabled = false
	dir = Direction.UP

# Function to get the player's input
func get_input():
	if Input.is_action_pressed("move_right"):
		velocity.x = 1
		dir = Direction.RIGHT
	elif Input.is_action_pressed("move_left"):
		velocity.x = -1
		dir = Direction.LEFT
	else:
		velocity.x = 0
		
	# Since UP/DOWN are at the end of the if-statements, they are prioritized in direction
	if Input.is_action_pressed("move_down"):
		velocity.y = 1
		dir = Direction.DOWN
	elif Input.is_action_pressed("move_up"):
		velocity.y = -1
		dir = Direction.UP
	else:
		velocity.y = 0
	
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
	
	velocity = velocity.normalized() * speed
	var motion : = Vector2()
	motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	motion.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	if get_slide_count() > 0:
		check_box_collision(motion)

func check_box_collision(motion : Vector2) -> void:
	if abs(motion.x) + abs(motion.y) > 1:
		return
	var box : = get_slide_collision(0).collider as Box
	if box:
		box.push(push_speed * motion, position)

func damage(var _knock):
	if not hit:
		emit_signal("damaged")
		hit = 1
	set_modulate(Color(1, 0.3, 0.3, 0.3))
	
	
	# Knockback implementation
#	if position.x < enemyposx:
#		velocity.x = -1
#		dir = Direction.RIGHT
#	elif position.x > enemyposx:
#		velocity.x = 1
#		dir = Direction.LEFT
#	if position.y < enemyposy:
#		velocity.y = -1
#		dir = Direction.UP
#	elif position.y > enemyposy:
#		velocity.y = 1
#		dir = Direction.DOWN
#	velocity = velocity.normalized() * knockback_force

	speed = player_speed / 2
	
	Input.action_release("move_down")
	Input.action_release("move_left")
	Input.action_release("move_right")
	Input.action_release("move_up")
	
	set_collision_mask_bit(2, false)
	# Take damage here
	
	if $Timer.is_stopped():
		$Timer.start()

# Player knockback is shorter than i-frames
# Player knockback is shorter than enemy knockback
func _on_Timer_timeout():
	set_modulate(Color(1, 1, 1, 1))
	set_collision_mask_bit(2, true)
	speed = player_speed
	hit = 0

# Calling the get_input function per frame (delta)
func _physics_process(_delta):
	if not freeze:
		get_input()
		velocity = move_and_slide(velocity)
	else:
		velocity = Vector2(0,0)
