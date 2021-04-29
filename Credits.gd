extends MarginContainer

const scrollRate = 200
var movementDirection = 0

func toTitle():
	Global.changeScene("res://Title.tscn")

func _on_Back_button_down():
	toTitle()
	
func _input(event):
	if(event.is_action_pressed("ui_accept") || event.is_action_pressed("ui_cancel")):
		toTitle()

func _process(delta):
	if(Input.is_action_pressed("ui_up")):
		movementDirection = -1
	elif(Input.is_action_pressed("ui_down")):
		movementDirection = 1
	else:
		movementDirection = 0
	$VSplitContainer/VSplitContainer/Scroll.scroll_vertical += (scrollRate * delta * movementDirection)
