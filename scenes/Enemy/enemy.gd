extends Node2D

const move_speed = 4

# entli color to show (as ENEMY_COLOR)
var selected_color: Enums.ENEMY_COLOR = 0
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
		start_hitting()

func set_color(c: Enums.ENEMY_COLOR):
	selected_color = c
	set_sprite_for_color(c)

func start_the_dead() -> void:
	$Laser.visible = false
	$AnimationPlayer.play("DIEDED_TO_DEATH")
	$AnimationPlayer.animation_finished.connect(delete_instance)

func delete_instance(anim_name: String):
	if anim_name == "DIEDED_TO_DEATH":
		queue_free()

func start_hitting():
	is_hitting = true
	$Laser/LeftEyeLaser.set_is_shooting(is_hitting)
	$Laser/RightEyeLaser.set_is_shooting(is_hitting)

func _on_hit_timer_timeout() -> void:
	var damage = GameState.enemy_damage
	if is_hitting:
		GameState.health -= damage
		hit.emit(damage)

func set_sprite_for_color(color: Enums.ENEMY_COLOR):
	match color:
		Enums.ENEMY_COLOR.BLACK:
			$Body.texture = load("res://assets/img/duck/enemy_black.png")
			$EnemyBody.texture = load("res://assets/img/duck/enemy_parts_black.png")
			$EnemyHead.texture = load("res://assets/img/duck/enemy_parts_black_head.png")
		Enums.ENEMY_COLOR.BLUE:
			$Body.texture = load("res://assets/img/duck/enemy_blue.png")
			$EnemyBody.texture = load("res://assets/img/duck/enemy_parts_blue.png")
			$EnemyHead.texture = load("res://assets/img/duck/enemy_parts_blue_head.png")
		Enums.ENEMY_COLOR.BROWN:
			$Body.texture = load("res://assets/img/duck/enemy_brown.png")
			$EnemyBody.texture = load("res://assets/img/duck/enemy_parts_brown.png")
			$EnemyHead.texture = load("res://assets/img/duck/enemy_parts_brown_head.png")
		Enums.ENEMY_COLOR.GREEN:
			$Body.texture = load("res://assets/img/duck/enemy_green.png")
			$EnemyBody.texture = load("res://assets/img/duck/enemy_parts_green.png")
			$EnemyHead.texture = load("res://assets/img/duck/enemy_parts_green_head.png")
		Enums.ENEMY_COLOR.ORANGE:
			$Body.texture = load("res://assets/img/duck/enemy_orange.png")
			$EnemyBody.texture = load("res://assets/img/duck/enemy_parts_orange.png")
			$EnemyHead.texture = load("res://assets/img/duck/enemy_parts_orange_head.png")
		Enums.ENEMY_COLOR.PURPLE:
			$Body.texture = load("res://assets/img/duck/enemy_purple.png")
			$EnemyBody.texture = load("res://assets/img/duck/enemy_parts_purple.png")
			$EnemyHead.texture = load("res://assets/img/duck/enemy_parts_purple_head.png")
		Enums.ENEMY_COLOR.RED:
			$Body.texture = load("res://assets/img/duck/enemy_red.png")
			$EnemyBody.texture = load("res://assets/img/duck/enemy_parts_red.png")
			$EnemyHead.texture = load("res://assets/img/duck/enemy_parts_red_head.png")
		Enums.ENEMY_COLOR.WHITE:
			$Body.texture = load("res://assets/img/duck/enemy_white.png")
			$EnemyBody.texture = load("res://assets/img/duck/enemy_parts_white.png")
			$EnemyHead.texture = load("res://assets/img/duck/enemy_parts_white_head.png")
		_:
			$Body.texture = load("res://assets/img/duck/enemy.png")
			$EnemyBody.texture = load("res://assets/img/duck/enemy_body.png")
			$EnemyHead.texture = load("res://assets/img/duck/enemy_head.png")
