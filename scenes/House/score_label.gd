extends Label

func _ready() -> void:
	GameState.score_updated.connect(on_score_updated)

func on_score_updated(new_score: int) -> void:
	text = str(new_score)
