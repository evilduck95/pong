extends AudioStreamPlayer

var last_play = 0


func _on_ball_body_entered(body: Node) -> void:
	var timestamp = Time.get_ticks_msec()
	if timestamp - last_play > 200:
		play(0)
		last_play = timestamp
