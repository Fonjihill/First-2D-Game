extends CanvasLayer

signal start_game
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	pass

func show_game_over():
	show_message("Game Over")
	
	yield($MessageTimer, "timeout")
	
	$Message.text = "Dodge the\nCreeps!"
	$Message.show()
	
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_StartButton_pressed():
	$Message.hide()


func _on_MessageTimer_timeout():
	$StartButton.hide()
	emit_signal("start_game")


func update_score(score):
	$ScoreLabel.text = str(score)

