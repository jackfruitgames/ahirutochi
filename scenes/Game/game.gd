extends Node2D

func _process(delta: float) -> void:
	if GameState.health < 0:
		# Game over
		print("Dead...")
		var end_scene = preload("res://scenes/GameOver/game_over.tscn")
		get_tree().change_scene_to_packed(end_scene)

func _on_soda_dream_shot_fired() -> void:
	new_random_recipe()
	if $Enemies/EnemyGroup.get_child_count() > 0:
		for enemy in $Enemies/EnemyGroup.get_children():
			enemy.kill_the_enemy()
			$Enemies.enemy_killed()

func _on_pot_bubble_exploded() -> void:
	GameState.health -= 10

func new_random_recipe():
	GameState.current_recipe = [
		randi_range(0, 2) as Enums.INGREDIENT,
		randi_range(0, 2) as Enums.INGREDIENT,
		randi_range(0, 2) as Enums.INGREDIENT
	]
	$Recipe.set_ingredients()

func _on_pot_pot_ready() -> void:
	GameState.current_used_ingredients = []
	new_random_recipe()
	$SodaDream.pot_ready()
