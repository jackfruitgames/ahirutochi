extends Node2D

const ingredients_text := "Quick! Drag the right ingredients into the pot!"
const bubble_text := "Don't let the bubbles hit the candle! Pop them!"
const lever_text := "Pull the lever to pump the potion into the SodaDream."
const pressure_text := "Wait for the pressure to rise and hit the BIG RED BUTTON!"

func _ready() -> void:
	$Label.text = bubble_text
	$AnimationPlayer.play("TYPE_TEXT")

func show_animated_text(text: String) -> void:
	$Label.text = text
	$AnimationPlayer.play("TYPE_TEXT")

func show_bubble_text() -> void:
	show_animated_text(bubble_text)

func show_ingredient_text() -> void:
	show_animated_text(ingredients_text)

func show_pot_ready_text() -> void:
	show_animated_text(lever_text)

func show_pressure_text() -> void:
	show_animated_text(pressure_text)
