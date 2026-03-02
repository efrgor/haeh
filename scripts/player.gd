extends KinematicBody2D

export(float) var speed = 220.0

func _physics_process(_delta):
	var input_dir = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)

	var velocity = input_dir.normalized() * speed
	move_and_slide(velocity)

	var rect = get_viewport_rect()
	global_position.x = clamp(global_position.x, 16.0, rect.size.x - 16.0)
	global_position.y = clamp(global_position.y, 16.0, rect.size.y - 16.0)
