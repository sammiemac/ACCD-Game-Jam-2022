extends TileMap

#var tile_size = get_cell_size()
#var half_tile_size = tile_size / 2
#
#var grid_size = Vector2(22, 16)
#var grid = []
#var Map
## Directions
#var arr2 = [Vector2(0, -1), Vector2(0, 1), Vector2(-1, 0), Vector2(1, 0)]
#enum {PLAYER, OBSTACLE, COLLECTABLE}
#
#onready var Wall = preload("res://Assets/Box/Box.tscn")
## Declare member variables here. Examples:
## var a = 2
## var b = "text"
## Box
#var arr = [Vector2(1, -1), Vector2(3, -1)]
## Called when the node enters the scene tree for the first time.
#func _ready():
#	for x in range(grid_size.x):
#		grid.append([])
#		for y in range(grid_size.y):
#			grid[x].append(null)
#	pass # Replace with function body.
#
#func is_cell_vacant(child_node, pos, direction):
##	print(pos)
#	var new_pos = Vector2((child_node.position.x - 160) / 320 + arr2[direction].x, (child_node.position.y - 160) / 320 + arr2[direction].y)
#	if arr.has(new_pos):
#		return false
#	else:
#		arr[arr.find(Vector2((child_node.position.x - 160) / 320, (child_node.position.y - 160) / 320))] = new_pos
#		print(pos)
#		print(arr)
#		return true
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
##    pass
#func update_child_pos(child_node, direction):
#	print(direction)
#	#if is_cell_vacant(child_node)
#	return is_cell_vacant(child_node, child_node.position, direction)

func _ready() -> void:
	for child in get_children():
		if child is GridBox:
			child.initialize(self)
