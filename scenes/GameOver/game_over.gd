extends Node2D

func _on_restart_button_pressed() -> void:
	GameState.reset_state()
	var gameScene: PackedScene = load("res://scenes/Game/game.tscn")
	get_tree().change_scene_to_packed(gameScene)
