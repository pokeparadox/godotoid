extends Node


# Declare member variables here. Examples:
var BallHeight = 1
const BonusPoints = 1000
const BrickBreakPoints = 50
const BouncePoint = 1
const StartLives = 3
var score = 0
var hiScore = 0
var level = 1
var lives = 3


func setBallHeight(screenHeight):
	BallHeight = 1 + ((OS.get_screen_size().y-screenHeight)/OS.get_screen_size().y)*3
