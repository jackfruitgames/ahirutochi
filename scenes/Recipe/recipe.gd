extends Node2D

var textures: Array = [
	preload("res://assets/img/scribbles/RED.png"),
	preload("res://assets/img/scribbles/GREEN.png"),
	preload("res://assets/img/scribbles/BLUE.png"),
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func set_ingredients(ingredients: Array) -> void:
	$Ingredient1.texture = textures[ingredients[0]]
	$Ingredient2.texture = textures[ingredients[1]]
	$Ingredient3.texture = textures[ingredients[2]]
