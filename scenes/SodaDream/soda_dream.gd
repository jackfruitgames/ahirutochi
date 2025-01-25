extends Node2D

signal shot_fired
# Fill of the tank from 0 to 100
var tank_fill_procentage = 0
# Pressure from 0 to 180 max
var pressure = 0


func pot_ready() -> void:
	$TmpFillTankButton.disabled = false

# start the whole filling process from outside
func start_filling() -> void:
	$TankFillTimer.start()


func _on_tmp_hit_button_pressed() -> void:
	if pressure >= 180:
		$PressureTimer.stop()
		tank_fill_procentage = 0
		$TankFillProgressBar.value = tank_fill_procentage
		pressure = 0
		$PressureGaugeNumber.text = str(pressure)
		$TmpFillTankButton.disabled = true
		shot_fired.emit()



func _on_tmp_fill_tank_button_pressed() -> void:
	start_filling()
	$TmpFillTankButton.disabled = true


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
		$PressureGaugeNumber.text = str(pressure)
	else:
		# pressure at max
		pass
