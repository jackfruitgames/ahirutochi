extends RayCast2D

var is_shooting := false

func _ready() -> void:
	set_physics_process(is_shooting)
	$Line2D.visible = is_shooting
	$LaserHitParticles.emitting = is_shooting

func _physics_process(delta: float) -> void:
	force_raycast_update()

	var cast_point = target_position
	if is_colliding():
		cast_point = to_local(get_collision_point())
	else:
		$LaserHitParticles.emitting = false
	$Line2D.points[1] = cast_point
	$LaserHitParticles.position = cast_point
	$LaserHitParticles.emitting = is_colliding()
	$Line2D.visible = is_colliding()

func set_is_shooting(cast: bool) -> void:
	print("phzsicsss: ", cast)
	is_shooting = cast
	set_physics_process(is_shooting)
