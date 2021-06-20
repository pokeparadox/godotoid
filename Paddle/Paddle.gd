extends KinematicBody2D

# Declare member variables here. Examples:
export var moveRate = 1.5
var movementDirection = 0
var leftPressed = false
var rightPressed = false

onready var startHeight = position.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(position.y != startHeight):
		position.y = startHeight
	
	if(Input.is_action_pressed("ui_left")):
		movementDirection = -1
	elif(Input.is_action_pressed("ui_right")):
		movementDirection = 1
	else:
		movementDirection = 0
	
	if(movementDirection == 0 ):
		if(leftPressed && !rightPressed):
			movementDirection = -1
		if(rightPressed && !leftPressed):
			movementDirection = 1
		
	var _result = move_and_collide(Vector2(movementDirection * (moveRate + Global.level * 0.1) , 0))
	


func _on_TouchLeft_pressed():
	leftPressed = true


func _on_TouchRight_pressed():
	rightPressed = true


func _on_TouchRight_released():
	rightPressed = false


func _on_TouchLeft_released():
	leftPressed = false
