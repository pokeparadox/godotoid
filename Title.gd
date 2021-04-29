extends MarginContainer

func _ready():
	$VBoxContainer/Start.grab_focus()

func _on_Start_button_down():
	Global.changeScene("res://GameState.tscn")


func _on_Credits_button_down():
	Global.changeScene("res://Credits.tscn")


func _on_Quit_button_down():
	get_tree().quit()
