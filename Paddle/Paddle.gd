extends KinematicBody2D

# Declare member variables here. Examples:
export var moveRate = 0.05
var movementDirection = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var _result = move_and_collide(Vector2(movementDirection * (moveRate + Global.level * 0.001) , 0))
	
func _input(event):
	if(event.is_action("ui_left") && !event.is_action_released("ui_left")):
		movementDirection = -1
	elif(event.is_action("ui_right") && !event.is_action_released("ui_right")):
		movementDirection = 1
	else:
		movementDirection = 0
