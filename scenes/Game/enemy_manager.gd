extends Node

var enemy_present = false

func create_new_enemy() -> void:
	enemy_present = true
	var new_enemy = preload("res://scenes/Enemy/enemy.tscn").instantiate()
	new_enemy.position = $SpawnPoint.position
	new_enemy.target_position = $TargetPoint.position
	$EnemyGroup.add_child(new_enemy)

func enemy_killed() -> void:
	enemy_present = false

func _on_new_enemy_timer_timeout() -> void:
	if not enemy_present:
		print("Create new enemy...")
		create_new_enemy()
	else:
		print("Not create new enemy because it already exists one")
