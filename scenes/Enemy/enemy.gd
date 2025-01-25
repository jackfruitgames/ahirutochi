extends Node2D

const move_speed = 4

# target position
var target_position = null
# true if the enemy should be hitting the house
var is_hitting = false
# emits every time a hit is done by the enemy
signal hit(damage: int)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if target_position:
		position = position.move_toward(target_position, move_speed)
	if not is_hitting and position.distance_to(target_position) < 1:
		is_hitting = true

func start_the_dead() -> void:
	$AnimationPlayer.play("DIEDED_TO_DEATH")
	$AnimationPlayer.animation_finished.connect(delete_instance)

func delete_instance(anim_name: String):
	if anim_name == "DIEDED_TO_DEATH":
		queue_free()
	

# TODO: delete this method when the caller is removed
func kill_the_enemy() -> void:
	#queue_free()
	pass

func _on_hit_timer_timeout() -> void:
	var damage = 5
	if is_hitting:
		GameState.health -= damage
		hit.emit(damage)
