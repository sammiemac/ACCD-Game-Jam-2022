# YT reference: https://youtu.be/gFlGMLmg8yg

extends KinematicBody2D


# Variable for enemy speed that can be accessed in the inspector
export (int) var enemy_speed = 10
# Variable for enemy velocity
var velocity = Vector2()

var path: Array = []
var level_navigation: Navigation2D = null
var player = null


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree(), "idle_frame")
	var tree = get_tree()
	if tree.has_group("LevelNavigation"):
		level_navigation = tree.get_nodes_in_group("LevelNavigation")[0]
	if tree.has_group("Player"):
		player = tree.get_nodes_in_group("Player")[0]


func _physics_process(_delta):
	if player and level_navigation:
#		rotation_degrees = get_angle_to(player.global_position)
		look_at(player.global_position)
		generate_path()
		navigate()
	move()


func navigate():
	if path.size() > 0:
		velocity = global_position.direction_to(path[1]) * enemy_speed
	
	if global_position == path[0]:
		path.pop_front()


func generate_path():
	if level_navigation != null and player != null:
		path = level_navigation.get_simple_path(global_position, player.global_position, false)


func move():
	velocity = move_and_slide(velocity)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
