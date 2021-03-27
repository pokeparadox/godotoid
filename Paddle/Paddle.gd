extends KinematicBody2D

# Declare member variables here. Examples:
export var moveRate = 0.05
var movementDirection = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(Input.is_action_pressed("ui_left")):
		movementDirection = -1
	elif(Input.is_action_pressed("ui_right")):
		movementDirection = 1
	else:
		movementDirection = 0
		
	var _result = move_and_collide(Vector2(movementDirection * (moveRate + Global.level * 0.001) , 0))
	
