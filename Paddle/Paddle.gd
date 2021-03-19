extends KinematicBody2D

# Declare member variables here. Examples:
export var moveRate = 90.0
var movementDirection = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_collide(Vector2(movementDirection * moveRate * delta, 0))
	
func _input(event):
	if(event.is_action("ui_left") && !event.is_action_released("ui_left")):
		movementDirection = -1
	elif(event.is_action("ui_right") && !event.is_action_released("ui_right")):
		movementDirection = 1
	else:
		movementDirection = 0
