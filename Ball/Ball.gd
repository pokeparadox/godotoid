extends KinematicBody2D
# Declare member variables here. Examples:
const acceleration = 0.001
const startSpeed = 0.005
const maxSpeed = 0.05
var speed = startSpeed
var velocity = Vector2(speed,speed)
onready var startPos = position

signal Lose
signal BallHit
signal BrickHit

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var collision = move_and_collide(velocity)
	if(collision):
		processCollision(collision)
	if(position.y  > get_viewport().size.y + $Sprite.texture.get_height()):
		speed = startSpeed
		velocity = velocity.normalized()*speed
		position = startPos
		emit_signal("Lose")
	
func processCollision(collision):
	speed += acceleration
	speed = clamp(speed,startSpeed,maxSpeed)
	
	if(collision.collider.is_in_group("Bouncy")):
		velocity = velocity.bounce(collision.normal)
	if(collision.collider.is_in_group("Bricks")):
		velocity = velocity.bounce(collision.normal).normalized()*speed
		get_parent().remove_child(collision.collider)
		emit_signal("BrickHit")
		
	Global.setBallHeight(position.y)
	emit_signal("BallHit")

func resetBall():
	position = startPos
	
