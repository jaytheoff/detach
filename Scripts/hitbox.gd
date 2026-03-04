extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var onMouseOver := false
var dragging := false
var drag_offset := Vector2.ZERO

func _physics_process(delta: float) -> void:
	if not dragging:
		if not is_on_floor():
			velocity += get_gravity() * delta

		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()


func _process(delta: float) -> void:
	if onMouseOver and Input.is_action_just_pressed("drag"):
		dragging = true
		drag_offset = global_mouse_position - global_position

	if Input.is_action_just_released("drag"):
		dragging = false

	if dragging:
		global_position = global_mouse_position - drag_offset


func _on_area_2d_mouse_entered() -> void:
	onMouseOver = true

func _on_area_2d_mouse_exited() -> void:
	onMouseOver = false