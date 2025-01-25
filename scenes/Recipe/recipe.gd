extends Node2D

var textures: Array = [
	preload("res://assets/img/ingredient/RED.png"),
	preload("res://assets/img/ingredient/GREEN.png"),
	preload("res://assets/img/ingredient/BLUE.png"),
]

func _process(delta: float) -> void:
	set_ingredients()

func set_ingredients() -> void:
	var ingredients = GameState.current_recipe
	$Ingredient1.texture = textures[ingredients[0]]
	$Ingredient2.texture = textures[ingredients[1]]
	$Ingredient3.texture = textures[ingredients[2]]
	if len(GameState.current_used_ingredients) >= 1 and GameState.current_used_ingredients[0] == GameState.current_recipe[0]:
		$Ingredient1_checkmark.visible = true
	else:
		$Ingredient1_checkmark.visible = false
	if len(GameState.current_used_ingredients) >= 2 and GameState.current_used_ingredients[1] == GameState.current_recipe[1]:
		$Ingredient2_checkmark.visible = true
	else:
		$Ingredient2_checkmark.visible = false
	if len(GameState.current_used_ingredients) >= 3 and GameState.current_used_ingredients[2] == GameState.current_recipe[2]:
		$Ingredient3_checkmark.visible = true
	else:
		$Ingredient3_checkmark.visible = false
