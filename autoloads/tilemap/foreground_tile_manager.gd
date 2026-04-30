extends Node

var soils: Array

func _ready() -> void:
	soils = TileLoader.load_grid(1, Vector2i(8,0), Vector2i(11,3))["tiles"]

func is_soil(atlas_pos: Vector2i) -> bool:
	return soils.has(atlas_pos)
