extends Node2D

signal bubble_exploded

@export var initial_spawn_delay: float = 1.0 # seconds
var initial_delay: bool = true


var speed: int = 20
var delta_sum: float = 0.0
var float_right: bool = true
var popped: bool = false

func _ready() -> void:
	$Bubble.visible = false
	$Explosion.visible = false
	$Explosion.animation_finished.connect(explosion_finished)

func _process(delta: float) -> void:
	delta_sum += delta
	if initial_delay:
		if delta_sum < initial_spawn_delay:
			return # wait for initial delay before doing anything
		else:
			initial_delay = false
			$Bubble.visible = true
	
	if (delta_sum > 2):
		delta_sum = 0
		float_right = !float_right
	
	# move bubble up and slightly left and right
	if !popped:
		position.y -= 3 * speed * delta
		position.x += (1 if float_right else -1 * delta_sum) * speed * delta
	
	if position.y < -500 and !popped:
		print("bubble: bubble explosion")
		$Explosion.visible = true
		$Explosion.play("default")
		$AudioStreamPlayer.play()
		bubble_exploded.emit()
		popped = true
		reset_bubble()


func explosion_finished():
	$Explosion.visible = false

func reset_bubble():
	$Bubble.visible = false
	$RespawnTimer.wait_time = randf_range(1, 3)
	$RespawnTimer.start()


func _on_bubble_button_pressed() -> void:
	popped = true
	GameState.add_to_score(GameState.points_for_bubble)
	reset_bubble()


func _on_respawn_timer_timeout() -> void:
	print("bubble: bubble respawn")
	popped = false
	$Bubble.visible = true
	position = Vector2i(randi_range(-50, 50), 0)
