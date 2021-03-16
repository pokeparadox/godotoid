extends KinematicBody2D

# Declare member variables here. Examples:
export var moveRate = 3.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# TODO check controls to move paddle
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moveRight(delta)


func moveLeft(delta):
	position.x -= moveRate * delta
	
func moveRight(delta):
	position.x += moveRate * delta
