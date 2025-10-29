extends Node2D

@onready var title = $Title
@onready var player_1_controls = $"Player 1 Controls"
@onready var instruction = $Instruction

var game_paused = true
var game_over = false
var game_start = true

func _ready() -> void:
	get_tree().paused = game_paused

func _process(delta: float) -> void:
	# Pause game on esc key
	if Input.is_action_just_pressed("ui_cancel") and not game_over and not game_start:
		invert_pause()
	# Restart after game over
	if game_over and Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()
	# First start of game
	if game_start and Input.is_action_just_pressed("ui_accept"):
		game_start = false
		invert_pause()
		# Setup text for pause screen
		title.text = "Paused"
		instruction.text = "Press esc to resume"

func invert_pause():
	game_paused = !game_paused
	get_tree().paused = game_paused
	visible = game_paused

func _on_ball_dead() -> void:
	await get_tree().create_timer(1).timeout
	game_over = true
	game_paused = true
	player_1_controls.visible = false
	title.text = "Game Over"
	instruction.text = "Press enter to restart"
	visible = true
