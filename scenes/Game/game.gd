extends Node2D

# TODO: main game logic, update global state etc

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_soda_dream_shot_fired() -> void:
	if $Enemy:
		$Enemy.kill_the_enemy()
