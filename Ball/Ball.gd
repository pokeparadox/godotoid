extends KinematicBody2D
# Declare member variables here. Examples:
export var acceleration = 0.001
var speed = 5.0
var velocity = Vector2(speed,speed)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta
	speed += acceleration * delta
	
func _set_direction(newDirection):
	velocity = newDirection
	velocity = velocity.normalized()
	velocity *= speed
