extends Node2D

var recipe: Array = [
	Enums.INGREDIENT.RED,
	Enums.INGREDIENT.GREEN,
	Enums.INGREDIENT.BLUE
]

func _ready() -> void:
	$Recipe.set_ingredients(recipe)


func _on_soda_dream_shot_fired() -> void:
	if $Enemy:
		$Enemy.kill_the_enemy()


func _on_pot_bubble_exploded() -> void:
	GameState.health -= 10
