extends Node2D

var IngredientScene = preload("res://scenes/Shelf/ingredient.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var index = 0
	for ingredient_type in Enums.INGREDIENT:
		var ingredient = IngredientScene.instantiate()
		ingredient.position = Vector2(250 * index, 10)
		print(ingredient_type)
		ingredient.set_type(ingredient_type)
		
		add_child(ingredient)
		index += 1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
