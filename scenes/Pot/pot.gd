extends Sprite2D

signal bubble_exploded
signal pot_ready


func _ready() -> void:
	$AnimationPlayer.play("RESET")
	$Fire.play()
	$Bubble1.bubble_exploded.connect(on_bubble_exploded)
	$Bubble2.bubble_exploded.connect(on_bubble_exploded)
	$Bubble3.bubble_exploded.connect(on_bubble_exploded)


func on_bubble_exploded() -> void:
	bubble_exploded.emit()
	print("pot: bubble exploded")


func add_ingredient(ingredient: Enums.INGREDIENT):
	$PotBlubber.modulate = Color.html("#000000")
	match ingredient:
		Enums.INGREDIENT.RED:
			$PotBlubber.modulate = Color.html("#ff0057")
			$AnimationPlayer.play("POT_RED")
		Enums.INGREDIENT.GREEN:
			$PotBlubber.modulate = Color.html("#169f45")
			$AnimationPlayer.play("POT_GREEN")
		Enums.INGREDIENT.BLUE:
			$PotBlubber.modulate = Color.html("#4725ff")
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
			$PotBlubber.modulate = Color.html("#644117")
			return
		index += 1

	if index < len(GameState.current_recipe):
		return
	$PotBlubber.modulate = Color.html("#ffd700")
	pot_ready.emit()
