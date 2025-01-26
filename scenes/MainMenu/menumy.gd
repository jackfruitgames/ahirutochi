extends Sprite2D

@export var initial_delay: float = 1.0

func _ready() -> void:
	$Timer.wait_time = initial_delay
	$Timer.start()
	$AnimationPlayer.animation_finished.connect(animation_finished)

func _on_timer_timeout() -> void:
	$AnimationPlayer.play("ENEMY_MARCH")
	$AnimationPlayer2.play("ENEMY_STEP")


func _on_texture_button_pressed() -> void:
	$DeadAnimationPlayer.play("DEAD_MARCHING")

func animation_finished(anim_name: String) -> void:
	print(anim_name)
	if anim_name == "ENEMY_MARCH":
		$DeadAnimationPlayer.play("RESET")
		$AnimationPlayer.play("RESET")
		$AnimationPlayer.play("ENEMY_MARCH")
