extends Sprite2D

@export var initial_delay: float = 1.0

func _ready() -> void:
	$Timer.wait_time = initial_delay
	$Timer.start()

func _on_timer_timeout() -> void:
	$AnimationPlayer.play("ENEMY_MARCH")
	$AnimationPlayer2.play("ENEMY_STEP")
