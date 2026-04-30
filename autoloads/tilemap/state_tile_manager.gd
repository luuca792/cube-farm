extends Node

var water: Array

func _ready() -> void:
	water = TileLoader.load_grid(1, Vector2i(12,8), Vector2i(12,8))["tiles"]

func is_water(atlas_pos: Vector2i) -> bool:
	return water.has(atlas_pos)
