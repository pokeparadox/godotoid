extends Node


# Declare member variables here. Examples:
var BallHeight = 1
const BonusPoints = 100
const BrickBreakPoints = 5
const BouncePoint = 1
const StartLives = 3
var score = 0
var hiScore = 0
var level = 1
var lives = 3
var saveFile = File.new()
var savePath = "user://savegame.save"
var saveData = {"highscore": 0} 

func createSave():
   saveFile.open(savePath, File.WRITE)
   saveFile.store_var(saveData)
   saveFile.close()

func setBallHeight(screenHeight):
	BallHeight = 1 + ((OS.get_screen_size().y-screenHeight)/OS.get_screen_size().y)*3
	
func _ready():
	if(!saveFile.file_exists(savePath)):
		createSave()

func saveHiScore():
	saveData["highscore"] = hiScore
	saveFile.open(savePath, File.WRITE)
	saveFile.store_var(saveData)
	saveFile.close()

func loadSave():
	saveFile.open(savePath, File.READ)
	saveData = saveFile.get_var()
	saveFile.close()
	hiScore = saveData["highscore"]
