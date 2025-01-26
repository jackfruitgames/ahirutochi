extends Sprite2D

signal bubble_exploded
signal pot_ready
signal wrong_ingredient

func _ready() -> void:
	$AnimationPlayer.play("RESET")
	$Fire.play()
	$Bubble1.bubble_exploded.connect(on_bubble_exploded)
	$Bubble2.bubble_exploded.connect(on_bubble_exploded)
	$Bubble3.bubble_exploded.connect(on_bubble_exploded)

func on_bubble_exploded() -> void:
	$PopAudio.play()
	bubble_exploded.emit()

func add_ingredient(ingredient: Enums.INGREDIENT):
	$IngredientAudio.play()
	var new_color = GameState.current_pot_color
	match ingredient:
		Enums.INGREDIENT.RED:
			new_color += Color.html("#ff0057")
			$AnimationPlayer.play("POT_RED")
		Enums.INGREDIENT.GREEN:
			new_color += Color.html("#169f45")
			$AnimationPlayer.play("POT_GREEN")
		Enums.INGREDIENT.BLUE:
			new_color = Color.html("#4725ff")
			$AnimationPlayer.play("POT_BLUE")

	GameState.current_used_ingredients.append(ingredient)
	new_color = new_color / len(GameState.current_used_ingredients)
	new_color.a = 1
	$PotBlubber.modulate = new_color
	GameState.current_pot_color = new_color
	check_if_recipe_is_finished()

func empty_the_pot():
	print("Pot empty, color: ", GameState.current_pot_color.to_html())
	GameState.current_sodadream_color = GameState.current_pot_color
	$PotBlubber.modulate = Color.WHITE
	GameState.current_pot_color = Color.BLACK

func check_if_recipe_is_finished():
	var index = 0
	print("RECEPEYY: ", GameState.current_recipe)
	print("CURRENT USED: ", GameState.current_used_ingredients)
	if len(GameState.current_used_ingredients) > len(GameState.current_recipe):
		wrong_ingredient_added()
		return

	for used_ingredient in GameState.current_used_ingredients:
		print("CHECK: ", used_ingredient, GameState.current_recipe[index])
		if GameState.current_recipe[index] != used_ingredient:
			wrong_ingredient_added()
			return
		index += 1

	if index < len(GameState.current_recipe):
		return
	pot_ready.emit()

func wrong_ingredient_added():
	print("WRONG RECEPYEE")
	GameState.current_used_ingredients = []
	$PotBlubber.modulate = Color.WHITE
	GameState.current_pot_color = Color.BLACK
	wrong_ingredient.emit()
