extends HBoxContainer
class_name Score

func set_player_name(playerName: String) -> void:
	$PlayerName.text = playerName

func set_score(score: int) -> void:
	$Score.text = str(score)
