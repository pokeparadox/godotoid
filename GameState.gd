extends Node2D

onready var bounceCount = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	setLives(Global.StartLives)
	setScore(0)
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
	bounceCount = bounceCount + 1
	addScore(Global.BouncePoint * bounceCount)

func _on_Ball_Lose():
	$Death.play()
	bounceCount = 0
	takeLife()
func _on_Ball_BrickHit():
	var bricks = get_tree().get_nodes_in_group("Bricks")
	addScore(Global.BrickBreakPoints * bounceCount)
	
	if(bricks.empty() && !soundPlaying):
		addScore(Global.BonusPoints * bounceCount)
		Global.level = Global.level + 1
		setLevel(Global.level)
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
		
func setLives(lives):
	Global.lives = lives
	$Lives.text = "Lives:" + String(lives)
	
func takeLife():
	Global.lives = Global.lives - 1
	setLives(Global.lives)
	if(Global.lives < 0):	
		if(Global.score > Global.hiScore):
			setHiScore(Global.score)
		setScore(0)
		setLives(Global.StartLives)
		setupBricks()
	
func setScore(points):
	Global.score = points
	$Score.text = "Score:" + String(points)

func addScore(points):
	setScore(Global.score + points)
	
func setLevel(lvl):
	Global.level = lvl
	$Level.text = "Lvl:" + String(lvl)
	
func setHiScore(hi):
	Global.hiScore = hi
	$HiScore.text = "Hi:" + String(hi)
