extends Node2D


# Declare member variables here. Examples:
var bricks = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	_setupBricks()

func _setupBricks():
	var brick = get_node("Brick")
	var i = 0
	for y in 6:
		for x in 10:
			bricks[i] = brick.duplicate()
			bricks[i].position = Vector2(x*40,y*16)
			i = i + 1
			
func _draw():
	for i in bricks:
		var brick = bricks[i]
		var sprite = brick.get_node("Sprite")
		draw_texture(sprite.texture,brick.position, Color(1,1,1,1), sprite.normal_map)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
