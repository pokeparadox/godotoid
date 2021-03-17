extends KinematicBody2D

# Declare member variables here. Examples:
export var moveRate = 9.0
var movementDirection = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(movementDirection<0):
		moveLeft(delta)
	elif(movementDirection>0):
		moveRight(delta)
	
func _input(event):
	if(event.is_action("ui_left") && !event.is_action_released("ui_left")):
		movementDirection = -1
	elif(event.is_action("ui_right") && !event.is_action_released("ui_right")):
		movementDirection = 1
	else:
		movementDirection = 0

func moveLeft(delta):
	position.x -= moveRate * delta
	
func moveRight(delta):
	position.x += moveRate * delta
