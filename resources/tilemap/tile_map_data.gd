extends Resource
class_name TileMapData

var tiles: Array[TileSlotData]

func get_slot(x_coord: float, y_coord: float) -> TileSlotData:
	for tile in tiles:
		if tile.coords.x == x_coord and tile.coords.y == y_coord:
			return tile
	return null
