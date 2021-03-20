extends Node


# Declare member variables here. Examples:
var BallHeight = 1

func setBallHeight(screenHeight):
	BallHeight = 1 + ((OS.get_screen_size().y-screenHeight)/OS.get_screen_size().y)*3
