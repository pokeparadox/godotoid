extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	setupBricks()

func setupBricks():
	var halfWidth = $Brick/Sprite.texture.get_width()/2
	var halfHeight = $Brick/Sprite.texture.get_height()/2
	for y in 6:
		for x in 10:
			var brick = $Brick.duplicate()
			brick.position = Vector2((x*40)+halfWidth,y*16+halfHeight)
			brick.add_to_group("Bricks")
			add_child(brick)

func _on_Ball_BallHit():
	$Audio.pitch_scale = Global.BallHeight
	$Audio.play()


func _on_Ball_Lose():
	$Death.play()


func _on_Ball_BrickHit():
	var bricks = get_tree().get_nodes_in_group("Bricks")
	if(bricks.empty() && !soundPlaying):
		$Ball.resetBall()
		playWinSound()
		setupBricks()
		
var playCount = 6
var soundPlaying = false
func playWinSound():
	soundPlaying = true
	playCount = 6
	$Win.play()			

func _on_Win_finished():
	playCount = playCount - 1
	if(playCount > 0):
		$Win.play()
	else:
		soundPlaying = false
		playCount = 6
