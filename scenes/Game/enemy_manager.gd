extends Node

signal new_enemy_spawned

var enemy_present = false

func create_new_enemy() -> void:
	enemy_present = true
	var new_enemy = preload("res://scenes/Enemy/enemy.tscn").instantiate()
	new_enemy.position = $SpawnPoint.position
	new_enemy.target_position = $TargetPoint.position
	new_enemy.set_color(randi_range(0, 8) as Enums.ENEMY_COLOR)
	$EnemyGroup.add_child(new_enemy)

func enemy_killed() -> void:
	GameState.add_to_score(GameState.points_for_kill)
	enemy_present = false

func _on_new_enemy_timer_timeout() -> void:
	if not enemy_present:
		print("Create new enemy...")
		create_new_enemy()
		new_enemy_spawned.emit()
	else:
		print("Not create new enemy because it already exists one")
