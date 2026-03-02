extends Node2D

export(PackedScene) var coin_scene
export(float) var game_duration = 30.0
export(float) var spawn_interval = 1.0
export(int) var target_score = 15

onready var coins_root = $Coins
onready var score_label = $UI/ScoreLabel
onready var timer_label = $UI/TimerLabel
onready var message_label = $UI/MessageLabel

var score = 0
var time_left = 0.0
var game_over = false
var spawn_cooldown = 0.0

func _ready():
	randomize()
	time_left = game_duration
	message_label.text = "Collect %d coins!" % target_score
	_update_ui()

func _process(delta):
	if game_over:
		return

	time_left -= delta
	spawn_cooldown -= delta

	if spawn_cooldown <= 0.0:
		spawn_cooldown = spawn_interval
		_spawn_coin()

	if time_left <= 0.0:
		time_left = 0.0
		_end_game(false)

	_update_ui()

func _spawn_coin():
	if coin_scene == null:
		return

	var coin = coin_scene.instance()
	if coin is Area2D:
		coins_root.add_child(coin)
		var rect = get_viewport_rect()
		coin.global_position = Vector2(
			rand_range(40.0, rect.size.x - 40.0),
			rand_range(40.0, rect.size.y - 40.0)
		)
		coin.connect("collected", self, "_on_coin_collected")

func _on_coin_collected():
	if game_over:
		return

	score += 1
	if score >= target_score:
		_end_game(true)
	_update_ui()

func _end_game(won):
	game_over = true
	message_label.text = "You Win!" if won else "Time's up!"
	for child in coins_root.get_children():
		child.queue_free()

func _update_ui():
	score_label.text = "Score: %d/%d" % [score, target_score]
	timer_label.text = "Time: %.1f" % time_left
