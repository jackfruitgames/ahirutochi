extends Node

var health = 100
var is_hand_full = false
var current_recipe: Array = [
	randi_range(0, 2) as Enums.INGREDIENT,
	randi_range(0, 2) as Enums.INGREDIENT,
	randi_range(0, 2) as Enums.INGREDIENT
]
