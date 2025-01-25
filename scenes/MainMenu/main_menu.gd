extends Control

var gameScene: PackedScene = preload("res://scenes/Game/game.tscn")

func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_packed(gameScene)
