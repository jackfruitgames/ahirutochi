extends Node2D

var textures: Array = [
	preload("res://assets/img/potions/RED.png"),
	preload("res://assets/img/potions/GREEN.png"),
	preload("res://assets/img/potions/BLUE.png"),
]


func _ready() -> void:
	set_ingredients()


func set_ingredients() -> void:
	var ingredients = GameState.current_recipe
	$Ingredient1.texture = textures[ingredients[0]]
	$Ingredient2.texture = textures[ingredients[1]]
	$Ingredient3.texture = textures[ingredients[2]]
