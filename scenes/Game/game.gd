extends Node2D

func _ready() -> void:
	$Background/BackgroundAnimationPlayer.play("parallax")
	$Enemies.new_enemy_spawned.connect(on_new_enemy_spawned)
	$Pot.wrong_ingredient.connect(on_wrong_ingredient)

func on_new_enemy_spawned() -> void:
	$Owl.show_ingredient_text()

func on_wrong_ingredient() -> void:
	$Owl.show_wrong_ingredient_text()

func _process(delta: float) -> void:
	if GameState.health < 0:
		# Game over
		var end_scene = preload("res://scenes/GameOver/game_over.tscn")
		get_tree().change_scene_to_packed(end_scene)
		MusicManager.switch_to_end()

func _on_soda_dream_shot_fired() -> void:
	$Pipes/Cannon.cannon_shot()
	$Enemies/DeathTimer.start()
	$Owl.show_bubble_text()
	if $Enemies/EnemyGroup.get_child_count() > 0:
		for enemy in $Enemies/EnemyGroup.get_children():
			enemy.start_the_dead()

func _on_pot_bubble_exploded() -> void:
	GameState.health -= GameState.bubble_damage

func new_random_recipe():
	GameState.current_recipe = [
		randi_range(0, 2) as Enums.INGREDIENT,
		randi_range(0, 2) as Enums.INGREDIENT,
		randi_range(0, 2) as Enums.INGREDIENT
	]
	$Recipe.set_ingredients()

func _on_pot_pot_ready() -> void:
	$SodaDream.pot_ready()
	$Owl.show_pot_ready_text()

func _on_death_timer_timeout() -> void:
	if $Enemies/EnemyGroup.get_child_count() > 0:
		for enemy in $Enemies/EnemyGroup.get_children():
			$Enemies.enemy_killed()

func _on_soda_dream_filling() -> void:
	print("empty the pot")
	GameState.current_used_ingredients = []
	new_random_recipe()
	$Pot.empty_the_pot()
	$Owl.show_pressure_text()

func _on_soda_dream_tank_exploded() -> void:
	$Pot.wrong_ingredient_added()
