extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var ingredient: Enums.INGREDIENT
var selected = false
var start_position = Vector2()
var pot_position

func set_type(type: Enums.INGREDIENT):
	var sprite = $Ingredient
	ingredient = type
	sprite.texture = load("res://assets/img/scribbles/%s.png" % Enums.INGREDIENT.keys()[type])
	
func set_start_position(_position: Vector2):	
	start_position = _position
	position = _position
	
func reset_position():
	position = start_position

func _on_ingredient_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("ClickOnShelfItem"):
		GameState.is_hand_full = true
		selected = true

	if selected and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
			GameState.is_hand_full = false
			use()

func _physics_process(delta: float) -> void:
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
		
	if pot_position != null:
		global_position = lerp(global_position, pot_position, 25 * delta)
		
		if global_position.is_equal_approx(pot_position):
			use()

func _on_ingredient_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "PotContentArea":
		selected = false
		GameState.is_hand_full = false
		
		var pot = area.get_parent()
		pot_position = pot.global_position
		#reset_position()
	
		pot.add_ingredient(ingredient)
	
func use():
	"""
	Uses the current ingredient and destroys it
	"""
	queue_free()
