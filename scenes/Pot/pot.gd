extends Sprite2D

signal bubble_exploded


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
