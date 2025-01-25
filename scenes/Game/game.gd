extends Node2D


func _ready() -> void:
	pass


func _on_soda_dream_shot_fired() -> void:
	new_random_recipe()
	if $Enemy:
		$Enemy.kill_the_enemy()


func _on_pot_bubble_exploded() -> void:
	GameState.health -= 10


func new_random_recipe():
	GameState.current_recipe = [
		randi_range(0, 2) as Enums.INGREDIENT,
		randi_range(0, 2) as Enums.INGREDIENT,
		randi_range(0, 2) as Enums.INGREDIENT
	]
	$Recipe.set_ingredients()
