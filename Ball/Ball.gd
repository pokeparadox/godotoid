extends KinematicBody2D
# Declare member variables here. Examples:
export var acceleration = 0.01
var speed = 0.005
var velocity = Vector2(speed,speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed += acceleration 
	var collision = move_and_collide(velocity)
	if(collision):
		processCollision(collision, delta)
	
func processCollision(collision, delta):
	var groups = collision.collider.get_groups()
	if(groups != null && groups.has("Bouncy")):
		velocity = velocity.bounce(collision.normal)
