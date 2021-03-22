extends Control

signal onQuit
signal onContinue

func _on_Continue_button_down():
	hide()
	get_tree().paused = false


func _on_Quit_to_Menu_button_down():
	get_tree().paused = false
	emit_signal("onQuit")
