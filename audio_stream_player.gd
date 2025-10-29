extends AudioStreamPlayer


func _on_ball_body_entered(body: Node) -> void:
	play(0)
