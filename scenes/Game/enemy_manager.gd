extends Node

func create_new_enemy() -> void:
	var new_enemy = load("res://scenes/Enemy/enemy.tscn")
	#$EnemyGroup.add_child(new_enemy)


func _on_new_enemy_timer_timeout() -> void:
	print("Create new enemy...")
	create_new_enemy()
