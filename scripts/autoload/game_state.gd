extends Node

signal score_updated(score: int)

# Game constants for balancing
const player_health := 100
const enemy_damage := 4
const bubble_damage := 1
const points_for_kill := 1000
const points_for_bubble := 100

var score: int = 0
var health = player_health
var is_hand_full = false
var current_recipe: Array = [
	randi_range(0, 2) as Enums.INGREDIENT,
	randi_range(0, 2) as Enums.INGREDIENT,
	randi_range(0, 2) as Enums.INGREDIENT
]
var current_used_ingredients: Array = []
var current_pot_color: Color = Color.BLACK

func add_to_score(points: int):
	score += points
	score_updated.emit(score)

func reset_state() -> void:
	score = 0
	health = player_health
	is_hand_full = false
	current_recipe = [
		randi_range(0, 2) as Enums.INGREDIENT,
		randi_range(0, 2) as Enums.INGREDIENT,
		randi_range(0, 2) as Enums.INGREDIENT
	]
	current_used_ingredients = []
	current_pot_color = Color.BLACK
