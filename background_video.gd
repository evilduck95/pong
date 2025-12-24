extends VideoStreamPlayer

var playing = false

func _process(delta: float) -> void:
	if playing and not is_playing():
		play()
	if is_playing() and stream_position > 0.74:
		paused = true

func _on_ball_dead() -> void:
	playing = true


func _on_mouse_input_mouse_entered() -> void:
	print("enter")
