extends Node2D
var playCount = 6
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
func _process(delta):
	var bricks = get_tree().get_nodes_in_group("Bricks")
	if(bricks.empty() && !$Win.playing && playCount > 0):
		$Win.play()
		playCount = playCount - 1

func _on_Ball_BallHit():
	$Audio.pitch_scale = Global.BallHeight
	$Audio.play()


func _on_Ball_Lose():
	$Death.play()
