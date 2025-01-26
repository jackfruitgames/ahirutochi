extends Node2D

signal shot_fired
signal filling
signal tank_exploded
# Fill of the tank from 0 to 100
var tank_fill_procentage = 0
# Pressure from 0 to 180 max
var pressure = 0

func _ready() -> void:
	$TankFillProgressBar.value = 0

func _process(delta: float) -> void:
	$Arrow.rotation_degrees = pressure - 90

func pot_ready() -> void:
	$FillTankButton.disabled = false

# start the whole filling process from outside
func start_filling() -> void:
	if pressure > 0:
		GameState.health -= GameState.tank_damage
		$PressureTimer.stop()
		tank_fill_procentage = 0
		$TankFillProgressBar.value = tank_fill_procentage
		pressure = 0
		$FillTankButton.disabled = true
		tank_exploded.emit()
		$Explosion.visible = true
		$Explosion.play()
	else:
		filling.emit()
		var color = GameState.current_sodadream_color.lightened(0.2)
		$TankFillProgressBar.get("theme_override_styles/fill").bg_color = color
		$TankFillTimer.start()

func _on_tmp_hit_button_pressed() -> void:
	if pressure >= 180:
		$PressureTimer.stop()
		tank_fill_procentage = 0
		$TankFillProgressBar.value = tank_fill_procentage
		pressure = 0
		$FillTankButton.disabled = true
		$ShotAudio.play()
		shot_fired.emit()

func _on_tmp_fill_tank_button_pressed() -> void:
	start_filling()
	$FillingAudio.play()
	$FillTankButton.disabled = true
	$AudioStreamPlayer.play()

func _on_tank_fill_timer_timeout() -> void:
	if tank_fill_procentage < 100:
		tank_fill_procentage += 10
	else:
		# Stop the filling, start the pressurizing
		$TankFillTimer.stop()
		$PressureTimer.start()

	$TankFillProgressBar.value = tank_fill_procentage

func _on_pressure_timer_timeout() -> void:
	if pressure < 180:
		pressure += 10
	else:
		# pressure at max
		pass

func _on_explosion_animation_finished() -> void:
	$Explosion.visible = false
