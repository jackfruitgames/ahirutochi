extends Control

var gameScene: PackedScene = preload("res://scenes/Game/game.tscn")
var scoreScene: PackedScene = preload("res://scenes/MainMenu/score/score.tscn")

func _ready() -> void:
	MusicManager.switch_to_main()
	load_scores()


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

func load_scores() -> void:

	var config = ConfigFile.new()
	var err = config.load("user://config.cfg")
	

	if err != OK:
		print("Error while loading config file")
		return

	var scores : Array = config.get_value("scores", "players")
	if(scores):
		scores.sort_custom(sort_descending)
		for i in len(scores):
			var score = scores[i]
			var playerScoreScene : Score = scoreScene.instantiate()
			playerScoreScene.set_player_name(score["playerName"])
			playerScoreScene.set_score(score["score"])
			$Leaderboard/LeaderBoardList.add_child(playerScoreScene)
			if i >= 8:
				break

func sort_descending(a, b):
	if a["score"] > b["score"]:
		return true
	return false
