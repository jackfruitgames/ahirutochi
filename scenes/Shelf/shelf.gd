extends Node2D

signal ingredient_used

var IngredientScene = preload("res://scenes/Shelf/ingredient.tscn")

func _add_ingredient(ingredient_type: String, index: int):
	var ingredient_position = $IngredientSpawns.position
	ingredient_position.y = index * 130
		
	var ingredient = IngredientScene.instantiate()
	ingredient.index = index
	ingredient.position = ingredient_position
	ingredient.set_type(Enums.INGREDIENT[ingredient_type])
	
	ingredient.ingredient_used.connect(_on_ingredient_used)
	ingredient.ingredient_selected.connect(_add_ingredient)
	
	$IngredientSpawns.add_child(ingredient)	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var index = 0
	for ingredient_type in Enums.INGREDIENT.keys():
		_add_ingredient(ingredient_type, index)
		index += 1

func _on_ingredient_used(ingredient: Enums.INGREDIENT):
	ingredient_used.emit(ingredient)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
