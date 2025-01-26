extends Control

func _ready() -> void:
	$VBoxContainer/ScoreLabel.text = "Final Score: " + str(GameState.score)
	
	var currentPlayerScore = GameState.score
	var config = ConfigFile.new()
	var err = config.load("user://config.cfg")
	if err != OK:
		return
	var lastPlayerName = config.get_value("config", "lastPlayerName")
	if (lastPlayerName):
		$VBoxContainer/PlayerName.text = lastPlayerName

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


func _on_enter_to_leaderboard_pressed() -> void:
	$VBoxContainer/MainMenuButton.show()
	$VBoxContainer/RestartButton.show()
	
	save_score($VBoxContainer/PlayerName.text)
	$VBoxContainer/EnterToLeaderboard.hide()
	$VBoxContainer/PlayerName.hide()
	
func save_score(playerName) -> void:
	var currentPlayerScore = GameState.score
	var scores = []
	var config = ConfigFile.new()
	var err = config.load("user://config.cfg")
	if err == OK:
		scores = config.get_value("scores", "players")
	
	scores.append({"playerName": playerName, "score": currentPlayerScore})
	config.set_value("scores", "players", scores)
	
	# Save the name of the last player
	config.set_value("config", "lastPlayerName", playerName)
	
	config.save("user://config.cfg")
	print("Saved score")
