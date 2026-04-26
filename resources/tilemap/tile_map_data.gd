extends Resource
class_name TileMapData

var tiles: Array[TileSlotData]

func get_slot(x_coord: int, y_coord: int) -> TileSlotData:
	for tile in tiles:
		if tile.coords.x == x_coord and tile.coords.y == y_coord:
			return tile
	return null

func get_slot_by_map_pos(map_pos: Vector2i) -> TileSlotData:
	for tile in tiles:
		if tile.coords == map_pos:
			return tile
	return null
