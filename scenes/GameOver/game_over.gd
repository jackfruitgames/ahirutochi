extends Control

func _on_restart_button_pressed() -> void:
	GameState.reset_state()
	MusicManager.switch_to_game()
	var gameScene: PackedScene = load("res://scenes/Game/game.tscn")
	get_tree().change_scene_to_packed(gameScene)


func _on_main_menu_button_pressed() -> void:
	GameState.reset_state()
	MusicManager.switch_to_main()
	var gameScene: PackedScene = load("res://scenes/MainMenu/main_menu.tscn")
	get_tree().change_scene_to_packed(gameScene)
