extends Sprite2D

signal bubble_exploded
signal pot_ready


func _ready() -> void:
	$AnimationPlayer.play("RESET")
	$Bubble1.bubble_exploded.connect(on_bubble_exploded)
	$Bubble2.bubble_exploded.connect(on_bubble_exploded)
	$Bubble3.bubble_exploded.connect(on_bubble_exploded)


func on_bubble_exploded() -> void:
	bubble_exploded.emit()
	print("pot: bubble exploded")


func add_ingredient(ingredient: Enums.INGREDIENT):
	match ingredient:
		Enums.INGREDIENT.RED:
			$AnimationPlayer.play("POT_RED")
		Enums.INGREDIENT.GREEN:
			$AnimationPlayer.play("POT_GREEN")
		Enums.INGREDIENT.BLUE:
			$AnimationPlayer.play("POT_BLUE")
			
	GameState.current_used_ingredients.append(ingredient)
	check_if_recipe_is_finished()


func check_if_recipe_is_finished():
	print("\n\n")
	var index = 0
	print("RECEPEYY: ", GameState.current_recipe)
	print("CURRENT USED: ", GameState.current_used_ingredients)
	for used_ingredient in GameState.current_used_ingredients:
		print("CHECK: ", used_ingredient, GameState.current_recipe[index])
		if GameState.current_recipe[index] != used_ingredient:
			GameState.current_used_ingredients = []
			print("WRONG RECEPYEE")
			return 
		index += 1

	if index < len(GameState.current_recipe):
		return

	pot_ready.emit()
