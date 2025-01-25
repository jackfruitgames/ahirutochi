extends Node2D

signal ingredient_used

var IngredientScene = preload("res://scenes/Shelf/ingredient.tscn")

func _add_ingredient(ingredient_type: String, _position: Vector2):	
	var ingredient = IngredientScene.instantiate()
	ingredient.set_start_position(_position)
	ingredient.set_type(Enums.INGREDIENT[ingredient_type])
	
	ingredient.ingredient_used.connect(_on_ingredient_used)
	ingredient.ingredient_selected.connect(_add_ingredient)
	
	add_child(ingredient)
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var index = 0
	for ingredient_type in Enums.INGREDIENT.keys():
		_add_ingredient(ingredient_type, Vector2(250 * index, 10))
		index += 1

func _on_ingredient_used(ingredient: Enums.INGREDIENT):
	ingredient_used.emit(ingredient)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
