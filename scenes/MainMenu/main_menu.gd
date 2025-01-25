extends Control

var gameScene: PackedScene = preload("res://scenes/Game/game.tscn")

func _ready() -> void:
	MusicManager.switch_to_main()


func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_packed(gameScene)
	MusicManager.switch_to_game()


func _on_leaderboard_button_pressed() -> void:
	$Leaderboard.visible = true
	$VBoxContainer.visible = false


func _on_close_leaderboard_button_pressed() -> void:
	$Leaderboard.visible = false
	$VBoxContainer.visible = true


func _on_credits_button_pressed() -> void:
	$Credits.visible = true
	$VBoxContainer.visible = false


func _on_close_credits_button_pressed() -> void:
	$Credits.visible = false
	$VBoxContainer.visible = true
