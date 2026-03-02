# Simple Godot Game: Coin Collector (Godot 3.6)

This repo includes a tiny starter game idea for **Godot 3.6**.

## Game concept
Move a player around the screen and collect coins before the timer runs out.

## What is included
- `scripts/main.gd`: game loop (coin spawning, score, timer, win/lose state)
- `scripts/player.gd`: player movement
- `scripts/coin.gd`: coin collect logic

## Quick setup in Godot 3.6
1. Create a new **2D** project and point it at this folder.
2. Make a scene named `Main.tscn` with this node tree:
   - `Main` (`Node2D`) and attach `scripts/main.gd`
   - `Player` (`KinematicBody2D`) and attach `scripts/player.gd`
     - `CollisionShape2D` (RectangleShape2D)
     - `Sprite` (or any visible 2D node)
   - `Coins` (`Node2D`) (empty container)
   - `UI` (`CanvasLayer`)
     - `ScoreLabel` (`Label`)
     - `TimerLabel` (`Label`)
     - `MessageLabel` (`Label`)
3. Create a second scene named `Coin.tscn`:
   - Root `Area2D` and attach `scripts/coin.gd`
   - `CollisionShape2D` (CircleShape2D)
   - `Sprite` (or any visible 2D node)
4. In `Main` scene, drag `Coin.tscn` into the exported `coin_scene` field.
5. Set **Project > Project Settings > Run > Main Scene** to `Main.tscn`.
6. Run the game.

## Input map
This project uses built-in Godot 3 actions, so no setup is required:
- `ui_left`
- `ui_right`
- `ui_up`
- `ui_down`

## Tuning values
In `scripts/main.gd` you can change:
- `game_duration`
- `spawn_interval`
- `target_score`

In `scripts/player.gd` you can change:
- `speed`

Have fun tweaking it (add sounds, particles, hazards, powerups).
