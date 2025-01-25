extends Node

var health = 100
var is_hand_full = false
var current_recipe: Array = [
	randi_range(0, 2) as Enums.INGREDIENT,
	randi_range(0, 2) as Enums.INGREDIENT,
	randi_range(0, 2) as Enums.INGREDIENT
]
var current_used_ingredients: Array = []

func reset_state() -> void:
	health = 100
	is_hand_full = false
	current_recipe = [
		randi_range(0, 2) as Enums.INGREDIENT,
		randi_range(0, 2) as Enums.INGREDIENT,
		randi_range(0, 2) as Enums.INGREDIENT
	]
	current_used_ingredients = []
