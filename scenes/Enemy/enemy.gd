extends Node2D

# target position
var target_position = null
# true if the enemy should be hitting the house
var is_hitting = true
# emits every time a hit is done by the enemy
signal hit(damage: int)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func kill_the_enemy() -> void:
	queue_free()


func _on_hit_timer_timeout() -> void:
	var damage = 5
	if is_hitting:
		GameState.health -= damage
		hit.emit(damage)
