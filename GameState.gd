extends Node2D

onready var bounceCount = 0

func _ready():
	setLives(Global.StartLives)
	setScore(0)
	setupBricks()
	Global.loadSave()
	setHiScore(Global.hiScore)
	$TouchLeft.visible = Global.touchEnabled
	$TouchRight.visible = Global.touchEnabled
	
func setupBricks():
	var bricks = get_tree().get_nodes_in_group("Bricks")
	if(bricks):
		for b in bricks:
			remove_child(b)
			
		bricks.clear()
	
	var halfWidth = $Brick/Sprite.texture.get_width()/2
	var halfHeight = $Brick/Sprite.texture.get_height()/2
	for y in 6:
		for x in 10:
			var brick = $Brick.duplicate()
			brick.position = Vector2((x*40)+halfWidth,y*16+halfHeight)
			brick.add_to_group("Bricks")
			add_child(brick)

func _on_Ball_BallHit():
	var radius = $Ball/CollisionShape2D.shape.radius 
	if(!$Audio.playing):
		$Audio.pitch_scale = Global.BallHeight
		$Audio.position = $Ball.position + Vector2(radius, radius)
		$Audio.play()
		bounceCount = bounceCount + 1
		addScore(Global.BouncePoint * bounceCount)
	elif($Ball.IsInDebounceArea() && $Audio.playing):
		var direction = -1
		$Ball.position.y = $Ball.position.y - (radius* direction)
		$Ball.velocity.y = $Ball.velocity.y * direction

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
		setLevel(1)
		setupBricks()
		while($Death.playing):
			yield(get_tree().create_timer(1.0), "timeout")
		pauseGame()
	
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
	Global.saveHiScore()


func _input(event):
	if(event.is_action_pressed("ui_accept")):
		pauseGame()
		
func pauseGame():
	get_tree().paused = true
	$PauseMenu.pause_mode = Node.PAUSE_MODE_PROCESS
	$PauseMenu.visible = true
		
func _on_PauseMenu_onQuit():
	Global.changeScene("res://Title.tscn")
